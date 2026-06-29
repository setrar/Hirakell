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
