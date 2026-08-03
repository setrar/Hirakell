{- HLINT ignore "Use camelCase" -}
{- HLINT ignore "Use tuple-section" -}
module Main where

import Control.Monad.State
import System.Random
import Data.Maybe (fromMaybe)
import qualified Data.ByteString as B
import Data.Word (Word8, Word32)  -- Added Word32 here!
import Data.Bits (shiftR, (.|.), (.&.)) -- Added this line for bitwise operators!

------------------------------------------------------------------------
-- 1. STRUCTURAL DATA TYPES & ALPHABET
------------------------------------------------------------------------

data CType = I | II | III | IV | V | VI | VII deriving (Eq, Show, Ord, Enum)
data MType = M2 | M3 | M4 | M5 | M6 | M7 deriving (Eq, Show, Ord, Enum)

type Var     = String
type Dur     = Rational
type Prob    = Double
type GenSeed = Int

data Chord = Chord Dur CType deriving (Eq, Show)

data Term = NT Chord              
          | S [Term]              
          | Mod MType Term        
          | Let Var Term Term     
          | Var Var               
  deriving (Eq, Show)

data Rule = (CType, Prob) :-> RuleFun
type RuleFun = Dur -> Term

------------------------------------------------------------------------
-- 2. THE PROG MONAD
------------------------------------------------------------------------

type Prog a = State StdGen a

getRand :: Prog Prob
getRand = do
  rng <- get
  let (r, rng') = randomR (0.0, 1.0) rng
  put rng'
  return r

runP :: Prog a -> StdGen -> a
runP = evalState

------------------------------------------------------------------------
-- 3. ALGORITHMIC STOCHASTIC UPDATE RULES
------------------------------------------------------------------------

applyRule :: [Rule] -> Chord -> Prog Term
applyRule rules (Chord d c) =
  let rs = filter (\((c', _):->_) -> c' == c) rules
  in do
    rd <- getRand
    return (choose rs rd d)

choose :: [Rule] -> Prob -> RuleFun
choose [] _ _ = error "Nothing to choose from!"
choose (((_, p'):-> rf):rs) p d
  | p <= p' || null rs = rf d
  | otherwise          = choose rs (p - p') d

update :: [Rule] -> Term -> Prog Term
update rules t = case t of
  NT x            -> applyRule rules x
  S s             -> S <$> mapM (update rules) s
  Mod m s         -> Mod m <$> update rules s
  Var x           -> return (Var x)
  Let x a expTerm -> Let x <$> update rules a <*> update rules expTerm

iter :: Monad m => (a -> m a) -> a -> m [a]
iter f a = do
  a' <- f a
  as <- iter f a'
  return (a : as)

gen :: [Rule] -> Int -> GenSeed -> Term -> Term
gen rules i s t = runP (iter (update rules) t) (mkStdGen s) !! i

expand :: [(Var, Term)] -> Term -> Term
expand env t = case t of
  Let x a expTerm -> expand ((x, expand env a) : env) expTerm
  Var x           -> fromMaybe (error (x ++ " is undefined")) (lookup x env)
  S s             -> S (map (expand env) s)
  Mod m s         -> Mod m (expand env s)
  x               -> x

------------------------------------------------------------------------
-- 4. MIDI COMPILER (TURNING ABSTRACT TERMS INTO AUDIO BYTES)
------------------------------------------------------------------------

type Pitch = Word8
type MIDIEvent = (Int, Bool, Pitch) -- (DeltaTime in ticks, IsNoteOn, Pitch)

-- Simple Voice Leading Interpretation: Maps Roman numerals to physical MIDI pitches
chordToPitches :: CType -> [Pitch]
chordToPitches I  = [60, 64, 67] -- C4, E4, G4 (C Major)
chordToPitches II = [62, 65, 69] -- D4, F4, A4 (D Minor)
chordToPitches IV = [65, 69, 72] -- F4, A4, C5 (F Major)
chordToPitches V  = [67, 71, 74] -- G4, B4, D5 (G Major)
chordToPitches _  = [60, 64, 67]

-- Flattens our structural AST tree down into sequential notes with timing lengths
collectChords :: Term -> [(Dur, CType)]
collectChords (NT (Chord d c)) = [(d, c)]
collectChords (S ts)           = concatMap collectChords ts
collectChords (Let _ _ expT)   = collectChords expT
collectChords (Mod _ t)        = collectChords t
collectChords (Var _)          = []

-- Converts durations and pitches into timed raw MIDI delta-on/off sequences
-- Converts durations and pitches into timed raw MIDI delta-on/off sequences safely
compileToMIDIEvents :: [(Dur, CType)] -> [MIDIEvent]
compileToMIDIEvents [] = []
compileToMIDIEvents ((dur, ctype):cs) =
  let ticks = round (dur * 960) -- 960 ticks per whole note (1/1 duration = 960 ticks)
  in case chordToPitches ctype of
    [] -> compileToMIDIEvents cs -- Fallback safety case
    (p:ps) ->
      let noteOns  = (0, True, p) : map (\pitch -> (0, True, pitch)) ps
          noteOffs = (ticks, False, p) : map (\pitch -> (0, False, pitch)) ps
      in noteOns ++ noteOffs ++ compileToMIDIEvents cs

-- Standard Spec-Compliant MIDI Variable-Length Quantity (VLQ) Encoder
toVarLen :: Int -> [Word8]
toVarLen n = go (n .&. 0x7F) (n `shiftR` 7)
  where
    go acc 0 = [fromIntegral acc]
    go acc rest = go ((rest .&. 0x7F) .|. 0x80) (rest `shiftR` 7) ++ [fromIntegral acc]

-- Turns raw event descriptions into exact format-0 stream hex values
buildTrackBytes :: [MIDIEvent] -> [Word8]
buildTrackBytes events = concatMap encodeEvent events ++ [0x00, 0xFF, 0x2F, 0x00]
  where
    encodeEvent (delta, isOn, pitch) =
      let status = if isOn then 0x90 else 0x80
      in toVarLen delta ++ [status, pitch, 64] -- 64 is a standard intermediate velocity

writeMIDIFile :: FilePath -> Term -> IO ()
writeMIDIFile path term = do
  let chords     = collectChords term
      events     = compileToMIDIEvents chords
      trackBytes = buildTrackBytes events
      len        = fromIntegral (length trackBytes) :: Word32
      
      -- Convert 32-bit track length to 4 big-endian bytes
      lenBytes   = [ fromIntegral (len `shiftR` 24)
                   , fromIntegral (len `shiftR` 16)
                   , fromIntegral (len `shiftR` 8)
                   , fromIntegral len ]
      
      -- 1. MThd Header Chunk (14 bytes):
      -- 'M''T''h''d' | Header Length (6) | Format 0 | 1 Track | Division (384 ticks/qtr note = 0x0180)
      mthdChunk = [ 0x4D, 0x54, 0x68, 0x64
                  , 0x00, 0x00, 0x00, 0x06
                  , 0x00, 0x00
                  , 0x00, 0x01
                  , 0x01, 0x80 ]
                  
      -- 2. MTrk Track Chunk:
      -- 'M''T''r''k' | 4-byte Track Byte Length | Track Data
      mtrkChunk = [ 0x4D, 0x54, 0x72, 0x6B ] ++ lenBytes ++ trackBytes
      
  B.writeFile path (B.pack (mthdChunk ++ mtrkChunk))
  putStrLn $ "Successfully compiled composition to valid MIDI: " ++ path
  
------------------------------------------------------------------------
-- 5. RUNNABLE GRAMMAR & REPL MAIN
------------------------------------------------------------------------

vRule, iRule, iiRule :: RuleFun
vRule d  = NT (Chord d V)
iRule d  = NT (Chord d I)
iiRule d = NT (Chord d II)

sampleRules :: [Rule]
sampleRules =
  [ (I, 1.0)  :-> (\t -> S [iiRule (t/2), vRule (t/2)])
  , (V, 0.5)  :-> (\t -> S [NT (Chord (t/2) IV), vRule (t/2)])
  , (V, 0.5)  :-> vRule
  , (II, 1.0) :-> (\t -> NT (Chord t II))
  , (IV, 1.0) :-> (\t -> NT (Chord t IV))
  ]

main :: IO ()
main = do
  let inputStart = NT (Chord 4.0 I) 
      generatedTree = gen sampleRules 4 42 inputStart -- Changed from 2 to 4!
      flattenedProgression = expand [] generatedTree

  putStrLn "--- 1. Generated Music AST ---"
  print flattenedProgression

  -- Step 5: Render directly to a MIDI audio file
  putStrLn "\n--- 2. Compiling Audio Output ---"
  writeMIDIFile "composition.mid" flattenedProgression
