> module Main where

> import Euterpea
> import System.Random

> data RNum = I | II | III | IV | V | VI | VII
>   deriving (Eq, Show, Ord, Enum)

> type PitchSpace = [AbsPitch]
> type ScalePCs = [AbsPitch]

> cModeScalePCs :: [ScalePCs]
> cModeScalePCs = allRots [0,2,4,5,7,9,11] 
>   where
>     allRots x = take 7 $ iterate doRot x
>     doRot []     = []
>     doRot (y:ys) = map (`mod` 12) (ys ++ [y + 12])

> choose :: StdGen -> [a] -> (StdGen, a)
> choose g xs =
>   let (r, g') = randomR (0, length xs - 1) g
>   in (g', xs !! r)

> nextBassRoot :: PitchSpace -> AbsPitch -> AbsPitch -> StdGen -> (StdGen, AbsPitch)
> nextBassRoot pSpace lastPitch nextPC g =
>   let nextPitches  = filter (\x -> x `mod` 12 == nextPC) pSpace
>       nextPitchesX = filter (\x -> abs(x - lastPitch) <= 12) nextPitches
>   in if null nextPitchesX 
>        then choose g nextPitches
>        else choose g nextPitchesX

> genBassRoots :: PitchSpace -> AbsPitch -> StdGen -> [AbsPitch] -> [AbsPitch]
> genBassRoots pSpace lastPitch g []     = []
> genBassRoots pSpace lastPitch g (x:xs) =
>   let (g1, x1) = nextBassRoot pSpace lastPitch x g
>   in x1 : genBassRoots pSpace x1 g1 xs

> chooseNearby :: PitchSpace -> AbsPitch -> AbsPitch -> StdGen -> (StdGen, AbsPitch)
> chooseNearby pSpace p1 p2 g =
>   let pSpaceA = filter (\x -> x > p1 - 7 && x < p2 + 7 && x /= p1 && x /= p2) pSpace
>       pSpaceB = filter (\x -> x /= p1 && x /= p2) [p1 - 7 .. p2 + 7]
>   in choose g (if null pSpaceA then pSpaceB else pSpaceA)

> chooseBetween :: PitchSpace -> AbsPitch -> AbsPitch -> StdGen -> (StdGen, AbsPitch)
> chooseBetween pSpace p1 p2 g =
>   let pSpaceA = filter (\x -> x > p1 && x < p2) pSpace
>       pSpaceB = if null pSpaceA then [p1..p2] else pSpaceA
>   in choose g pSpaceB

> probChromatic :: Double
> probChromatic = 0.2

> fill1 :: PitchSpace -> ScalePCs -> AbsPitch -> AbsPitch -> StdGen -> (StdGen, AbsPitch)
> fill1 pSpace mode p1 p2 g =
>   let pSpaceM   = filter (\p -> elem (mod p 12) mode) pSpace
>       (r, g1)   = randomR (0.0, 1.0 :: Double) g
>       thePSpace = if r < probChromatic then pSpace else pSpaceM
>   in if abs(p2 - p1) == 2 
>        then (g, min p1 p2 + 1) -- distance 2? Add a chromatic step
>        else if abs(p2 - p1) <= 1 
>               then chooseNearby thePSpace (min p1 p2) (max p1 p2) g -- no room? Choose nearby
>               else chooseBetween thePSpace (min p1 p2) (max p1 p2) g -- otherwise, choose a middle pitch

> fillRec :: PitchSpace -> [(AbsPitch, ScalePCs)] -> StdGen -> (StdGen, [(AbsPitch, ScalePCs)])
> fillRec pSpace ((x1, mode1):(x2, mode2):xs) g =
>   let (g1, newP)    = fill1 pSpace mode1 x1 x2 g
>       (g2, otherPs) = fillRec pSpace ((x2, mode2):xs) g1 -- recursive call
>   in (g2, (x1, mode1) : (newP, mode1) : otherPs)
> fillRec pSpace x g = (g, x)

> nextBassMeasure :: PitchSpace -> ScalePCs -> AbsPitch -> AbsPitch -> StdGen -> (StdGen, ScalePCs)
> nextBassMeasure pSpace mode p1 p2 g =
>   let (g1, bassLayer1) = fillRec pSpace [(p1, mode), (p2, mode)] g
>       (g2, bassLayer2) = fillRec pSpace bassLayer1 g1
>   in (g2, take (length bassLayer2 - 1) $ map fst bassLayer2)

> bassGenRec :: PitchSpace -> [(AbsPitch, ScalePCs)] -> StdGen -> [AbsPitch]
> bassGenRec pSpace ((x1, mode1):(x2, mode2):xs) g =
>   let (g1, nextPs) = nextBassMeasure pSpace mode1 x1 x2 g
>   in nextPs ++ bassGenRec pSpace ((x2, mode2):xs) g1
> bassGenRec pSpace x g = map fst x

> bassToMusic :: [AbsPitch] -> StdGen -> Music (AbsPitch, Volume)
> bassToMusic [] g  = rest 0
> bassToMusic [x] g = note wn (x, 120)
> bassToMusic (x1:x2:xs) g =
>   let (r, g1) = randomR (0.0, 1.0 :: Double) g
>       m = if r < 0.7 
>             then note qn (x1, 120) 
>             else if r < 0.8 
>                    then note (3*sn) (x1, 120) :+: note (sn) (x2 + 1, 80) 
>                    else if r < 0.9 
>                           then note (3*sn) (x1, 120) :+: note (sn) (x1, 80) 
>                           else note (3*sn) (x1, 120) :+: note (sn) (x2 - 1, 80)
>   in m :+: bassToMusic (x2:xs) g1

> chordsToMusic :: [[AbsPitch]] -> StdGen -> Music (AbsPitch, Volume)
> chordsToMusic [] g  = rest 0
> chordsToMusic [x] g = chord $ map (\p -> note wn (p, 80)) x
> chordsToMusic (x:xs) g =
>   let (g1, durs) = choose g [[hn, hn], [2*qn/3, wn - 2*qn/3], [dhn, qn]]
>       fx d       = chord $ map (\p -> note d (p, 80)) x
>       m          = line $ map fx durs
>   in m :+: chordsToMusic xs g1

> makeJazz :: AbsPitch -> Bool -> [RNum] -> StdGen -> Music (AbsPitch, Volume)
> makeJazz root isMajor rNums g =
>   let modeList = if isMajor 
>                    then cModeScalePCs -- using major
>                    else drop 5 cModeScalePCs ++ take 5 cModeScalePCs -- handle minor selection
>       bassRange        = [30..50]
>       initScalePCss    = map ((cModeScalePCs !!) . fromEnum) rNums -- turn numerals into C-major modes
>       ms               = map (map ((`mod` 12) . (+root))) $ initScalePCss -- transpose modes based on root
>       ms0              = map (\m -> case m of (x:_) -> x; [] -> 0) ms -- get mode roots
>       gs               = infSplit g -- set up an infinite supply of generators
>       (gsp, startPoint)= choose (gs !! 0) bassRange -- pick a general starting point for the bass
>       initBassPitches0 = genBassRoots bassRange startPoint gsp ms0 -- choose measure nodes
>       bassMeasurePs    = bassGenRec bassRange (zip initBassPitches0 ms) (gs !! 1) -- gen bass pitches
>       bassMusic        = bassToMusic bassMeasurePs (gs !! 2) -- convert bass to Music with ornaments
>       chords           = map (map (+60)) $ -- transposition above bassline
>                          map (\x -> [x !! 0, x !! 2, x !! 4, x !! 6]) ms -- form a simple seventh chord
>       chordMusic       = chordsToMusic chords (gs !! 3) -- convert chords to Music with rhythm
>   in instrument AcousticBass bassMusic :=: instrument RhodesPiano chordMusic 
>   where
>     infSplit :: StdGen -> [StdGen] -- necessary to get many generators from just one
>     infSplit g = let (g1, g2) = splitGen g in g1 : infSplit g2

> majorHomeKey :: Bool
> majorHomeKey = False -- change to false to get a minor home key

> homeKeyRoot :: AbsPitch
> homeKeyRoot = 0 -- change to another pitch class number if desired (ex: G=7)

> main :: IO ()
> main = do
>   gR <- newStdGen
>   gM <- newStdGen
>   let allRNums  = enumFrom I
>       chordProg = map (allRNums !!) $ randomRs (0, length allRNums - 1) gR
>       m         = makeJazz homeKeyRoot majorHomeKey chordProg gM
>   playDev 7 m
