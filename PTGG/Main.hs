{- HLINT ignore "Use camelCase" -}
{- HLINT ignore "Use tuple-section" -}
module Main where

import Control.Monad.State
import Data.List (nub, sort)
import System.Random
import Data.Maybe (fromMaybe)

------------------------------------------------------------------------
-- 1. STRUCTURAL DATA TYPES & ALPHABET
------------------------------------------------------------------------

-- Abstract chords built on scale degrees (e.g., I, IV, V)
data CType = I | II | III | IV | V | VI | VII
  deriving (Eq, Show, Ord, Enum)

-- Diatonic scale degree modulations (2nd through 7th degrees)
data MType = M2 | M3 | M4 | M5 | M6 | M7
  deriving (Eq, Show, Ord, Enum)

type Var     = String   -- For graph grammar sharing/variables
type Dur     = Rational -- To accurately measure musical timing/rhythm
type Prob    = Double   -- Probabilities associated with production rules
type GenSeed = Int      -- Renamed to avoid clashing with System.Random.Seed

-- A chord parameterized explicitly by its duration
data Chord = Chord Dur CType
  deriving (Eq, Show)

-- Sentential Form Tree Structure (The main AST)
data Term = NT Chord              -- Non-terminal leaf node
          | S [Term]              -- Structural parallel sequence
          | Mod MType Term        -- Key modulation block
          | Let Var Term Term     -- Let-in syntax for graph structure sharing
          | Var Var               -- Call to an existing variable definition
  deriving (Eq, Show)

-- A production rule maps an entry chord type + probability to a function
data Rule = (CType, Prob) :-> RuleFun
type RuleFun = Dur -> Term

------------------------------------------------------------------------
-- 2. THE PROG MONAD (FOR RANDOM THREADING)
------------------------------------------------------------------------

-- No newtype, no instance boilerplate, no deriving required
type Prog a = State StdGen a

-- Fetching a random probability uses clean, native monadic actions
getRand :: Prog Prob
getRand = do
  rng <- get
  let (r, rng') = randomR (0.0, 1.0) rng
  put rng'
  return r

-- Running wrapper to unveil evaluation contents
runP :: Prog a -> StdGen -> a
runP = evalState

------------------------------------------------------------------------
-- 3. ALGORITHMIC STOCHASTIC UPDATE RULES
------------------------------------------------------------------------

-- Filters active ruleset matching current chord degree and picks one
applyRule :: [Rule] -> Chord -> Prog Term
applyRule rules (Chord d c) =
  let rs = filter (\((c', _):->_) -> c' == c) rules
  in do
    rd <- getRand
    return (choose rs rd d)

-- Standard step selector iterating through accumulated probability distributions
choose :: [Rule] -> Prob -> RuleFun
choose [] _ _ = error "Nothing to choose from!"
choose (((_, p'):-> rf):rs) p d
  | p <= p' || null rs = rf d
  | otherwise          = choose rs (p - p') d

-- Depth-first traversal mapping leaves (NT structures) to rules in parallel
update :: [Rule] -> Term -> Prog Term
update rules t = case t of
  NT x       -> applyRule rules x
  S s        -> do ss <- mapM (update rules) s
                   return (S ss)
  Mod m s    -> do s' <- update rules s
                   return (Mod m s')
  Var x      -> return (Var x)
  Let x a expTerm -> do a' <- update rules a
                        expTerm' <- update rules expTerm
                        return (Let x a' expTerm')

-- Helper function iterating monadic functions to structural limits
iter :: Monad m => (a -> m a) -> a -> m [a]
iter f a = do
  a' <- f a
  as <- iter f a'
  return (a : as)

-- Main processing wrapper
gen :: [Rule] -> Int -> GenSeed -> Term -> Term
gen rules i s t = runP (iter (update rules) t) (mkStdGen s) !! i

------------------------------------------------------------------------
-- 4. GRAMMAR ENVIRONMENT & VARIABLE EXPANSION
------------------------------------------------------------------------

-- Erases variable scopes across graph edges using standard lexical context
expand :: [(Var, Term)] -> Term -> Term
expand env t = case t of
  Let x a expTerm -> expand ((x, expand env a) : env) expTerm
  Var x -> fromMaybe (error (x ++ " is undefined")) (lookup x env)
  S s             -> S (map (expand env) s)
  Mod m s         -> Mod m (expand env s)
  x               -> x

------------------------------------------------------------------------
-- 5. CHORD SPACES & EQUIVALENCE DEFINITIONS
------------------------------------------------------------------------

type AbsChord = [Int] -- Integer mapping where C=0, C#=1...
type EqRel a  = a -> a -> Bool
type QSpace a = [[a]]

-- OPC-Equivalence check matching pitch vectors modulo 12
opcEq :: EqRel AbsChord
opcEq a b = f a == f b
  where f = nub . sort . map (`mod` 12)

-- Custom quotient space slash-operator (S // R mapping)
(//) :: (Eq a) => [a] -> EqRel a -> QSpace a
[] // _ = []
(x:xs) // r = let classX = filter (r x) (x:xs)
                  rest   = filter (not . r x) xs
              in classX : (rest // r)

------------------------------------------------------------------------
-- 6. RUNNABLE SYSTEM TEST EXECUTION
------------------------------------------------------------------------

-- Mock shorthand values representing primitive rule functions
vRule, iRule, iiRule :: RuleFun
vRule d  = NT (Chord d V)
iRule d  = NT (Chord d I)
iiRule d = NT (Chord d II)

-- Sample test grammar profile (with complete rules for all generated chords)
sampleRules :: [Rule]
sampleRules =
  [ (I, 1.0)  :-> (\t -> S [iiRule (t/2), vRule (t/2)])
  , (V, 0.5)  :-> (\t -> S [NT (Chord (t/2) IV), vRule (t/2)])
  , (V, 0.5)  :-> vRule
  , (II, 1.0) :-> (\t -> NT (Chord t II)) -- Base case for II
  , (IV, 1.0) :-> (\t -> NT (Chord t IV)) -- Base case for IV
  ]

main :: IO ()
main = do
  -- Step 1: Start with a whole note Tonic chord
  let inputStart = NT (Chord 1.0 I)

  -- Step 2: Generate progression trees via the randomized Monad pipeline
  let generatedTree = gen sampleRules 2 42 inputStart
  putStrLn "--- 1. Generated Graph Grammar AST Structure ---"
  print generatedTree

  -- Step 3: Unwind environment variables under lexical rules
  let flattenedProgression = expand [] generatedTree
  putStrLn "\n--- 2. Flattened Structure (Variables Replaced) ---"
  print flattenedProgression

  -- Step 4: Validate Chord Space Equivalence mappings
  putStrLn "\n--- 3. Testing Pitch Space Equivalence (Chord Spaces) ---"
  let cMajorTriad   = [0, 4, 7]        -- C, E, G
      cMajorVoicing = [48, 52, 55, 60] -- Dynamic multidimensional variant

  if opcEq cMajorTriad cMajorVoicing
    then putStrLn "Success: The alternative voice belongs to the abstract C Major Chord Space!"
    else putStrLn "Failed: Voicings did not mathematically match structural criteria."
