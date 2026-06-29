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
