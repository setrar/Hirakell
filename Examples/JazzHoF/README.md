To use our `realBookTune` engine, we need to complete the pipeline. Since `realBookTune` is a higher-order function that **returns a function**, using it is a two-step process:

1. Call `realBookTune` with a song name to get your **custom arranger function**.
2. Pass the chord data and rhythm parameters to that returned function to finally generate the executable **Euterpea `Music` structure**.

Let's expand the previous skeleton into a fully functional, compilation-ready example so you can see exactly how to invoke it.

### 1. The Implementation Code

Save this code in a file (e.g., `jazzBook.hs`):

```haskell
module JazzBook where

import Euterpea

type ChordProgression = [Pitch]
type Arranger         = ChordProgression -> Dur -> Music Pitch

-- =====================================================================
-- THE HIGHER-ORDER FUNCTION (Returns an 'Arranger' function)
-- =====================================================================
realBookTune :: String -> Arranger
realBookTune "AutumnLeaves" = \chords duration ->
  -- Returns a smooth, arpeggiated walking style for jazz ballads
  let playArpeggio []     = rest (duration * 4)
      playArpeggio (p:ps) = note duration p :+: playArpeggio ps
  in  playArpeggio chords

realBookTune "GiantSteps" = \chords duration ->
  -- Returns a fast, vertical "sheets of sound" block-chord engine
  let playBlock [] = rest duration
      playBlock ps = chord (map (note duration) ps)
  in  playBlock chords

-- Fallback case if the tune isn't in our book
realBookTune _ = \_ duration -> rest duration


-- =====================================================================
-- 2. THE REAL-WORLD DATA (The Parameters)
-- =====================================================================
-- Let's define a simple ii-V-I chord progression in C Major
iiV_I :: ChordProgression
iiV_I = [ (D,4), (G,4), (C,4) ]

```

---

### 2. How to use it in GHCI

Load up your script:

```bash
ghci jazzBook.hs

```

#### Step A: Capture the returned function (Partial Application)

First, call `realBookTune` with just the song name string. Haskell will evaluate it and hand you back a brand-new, specialized rendering function.

```haskell
ghci> -- Extracting the 'AutumnLeaves' arranger engine
ghci> autumnArranger = realBookTune "AutumnLeaves"

```

#### Step B: Execute the returned function

Now, pass your chord progression data and beat durations into your newly created `autumnArranger` function:

```haskell
ghci> -- This computes a smooth, linear arpeggio phrase!
ghci> balladPiece = autumnArranger iiV_I qn

```

#### Step C: Compare it on the fly!

Because `realBookTune` returns a completely different function depending on the string input, you can pass the *exact same chords* into a different style instantly:

```haskell
ghci> -- Extracting the 'GiantSteps' block-chord engine
ghci> coltraneArranger = realBookTune "GiantSteps"
ghci> 
ghci> -- This computes a sudden, vertical stack of solid chords!
ghci> intensePiece = coltraneArranger iiV_I qn

```

### The Ultimate One-Liner Syntax

Because of how Haskell evaluates functions from left to right, you don't even have to assign intermediate names if you are in a hurry. You can chain the arguments sequentially right next to each other:

```haskell
ghci> play (realBookTune "AutumnLeaves" iiV_I en)

```

The computer evaluates `realBookTune "AutumnLeaves"`, gets a function back, and immediately feeds `iiV_I` and `en` into it. You've built an abstract jazz machine where strings mutate into musical style generators!

---

Here is everything we just discussed brought together into a single, complete, copy-and-paste file.

Save this file as **`JazzEnsemble.hs`**. It contains the custom Higher-Order Type (`Ensemble`), the `Functor` implementation for jazz transformation, and the final playback/export functions.

```haskell
module JazzEnsemble where

import Euterpea
import qualified Codec.Midi as HMidi

-- =====================================================================
-- 1. THE HIGHER-ORDER TYPE (The Ensemble Blueprint)
-- =====================================================================
-- A type that takes another type 'a' as an argument.
data Ensemble a = Trio a a a | Quartet a a a a
  deriving (Show, Eq)

-- Make our Higher-Order Type a Functor so we can map transformations over it
instance Functor Ensemble where
  fmap function (Trio x y z)      = Trio (function x) (function y) (function z)
  fmap function (Quartet w x y z) = Quartet (function w) (function x) (function y) (function z)


-- =====================================================================
-- 2. TRANSFORMATION ENGINE & PLAYBACK UTILITIES
-- =====================================================================
-- Unpacks the higher-order structure and collapses it into Euterpea's parallel tree
collapseEnsemble :: Ensemble (Music Pitch) -> Music Pitch
collapseEnsemble (Trio track1 track2 track3)     = track1 :=: track2 :=: track3
collapseEnsemble (Quartet t1 t2 t3 t4)           = t1 :=: t2 :=: t3 :=: t4

-- Play live out of speakers via GHCI
playEnsemble :: Ensemble (Music Pitch) -> IO ()
playEnsemble ensemble = play (collapseEnsemble ensemble)


-- =====================================================================
-- 3. THE LIVE JAZZ GIG (Data Definition)
-- =====================================================================
-- Let's build a raw C-Major triad vamp inside our abstract Trio wrapper
myOriginalVamp :: Ensemble (Music Pitch)
myOriginalVamp = Trio (c 4 qn) (e 4 qn) (g 4 qn)

-- Let's apply a "Swing Shift" modulation over the whole ensemble using fmap
-- This transposes every element inside the Higher-Order Type up 3 semitones (Minor 3rd)
modulatedVamp :: Ensemble (Music Pitch)
modulatedVamp = fmap (transpose 3) myOriginalVamp


-- =====================================================================
-- 4. BONUS: BULLETPROOF STUDIO MIDI EXPORTER
-- =====================================================================
-- Compiles your collapsed type safely into a Multi-Track Type-1 MIDI file
exportEnsembleMidi :: FilePath -> Int -> Int -> Ensemble (Music Pitch) -> IO ()
exportEnsembleMidi filename num denom ensemble = do
  let music = collapseEnsemble ensemble
  let denomPower = round (logBase 2 (fromIntegral denom) :: Double)
  let instrumentPerformances = splitByInst (perform music)
  let musicTracks = concatMap (HMidi.tracks . toMidi . snd) instrumentPerformances
  let timeSigTrack = [(0, HMidi.TimeSignature num denomPower 24 8), (0, HMidi.TrackEnd)]
  let rawMidiStruct = toMidi (perform music)
  let fixedMidiFile = rawMidiStruct { HMidi.tracks = timeSigTrack : musicTracks }
  
  HMidi.exportFile filename fixedMidiFile
  putStrLn $ "🚀 Dumped ensemble to " ++ filename ++ " (" ++ show num ++ "/" ++ show denom ++ " Grid)"

```

### How to run it:

1. Fire up your terminal and load the file:
```bash
ghci -package HCodecs JazzEnsemble.hs

```


2. Play the original root vamp:
```haskell
ghci> playEnsemble myOriginalVamp

```


3. Play the modulated version processed via your Higher-Order `fmap`:
```haskell
ghci> playEnsemble modulatedVamp

```


4. Dump it to a file for your DAW/MuseScore:
```haskell
ghci> writeMidi "jazz_trio.mid" (collapseEnsemble modulatedVamp)

```
