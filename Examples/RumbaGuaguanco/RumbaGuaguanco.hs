module Main where

import Euterpea

-- ==========================================
-- 1. INSTRUMENT DEFINITIONS
-- ==========================================

clvInstr :: PercussionSound
clvInstr = HiWoodBlock

katInstr :: PercussionSound
katInstr = LowWoodBlock

-- Short helpers to make the grid highly readable
cHit :: Music Pitch
cHit = perc clvInstr sn

kHit :: Music Pitch
kHit = perc katInstr sn

-- ==========================================
-- 2. RHYTHMIC PATTERNS
-- ==========================================

-- Clave Pattern (from previous image)
rumbaClave :: Music Pitch
rumbaClave = line [
    -- BAR 1
    cHit,    rest sn, rest sn, rest sn,
    rest sn, rest sn, cHit,    rest sn,
    rest sn, rest sn, rest sn, rest sn,
    rest sn, rest sn, cHit,    rest sn,
    -- BAR 2
    rest sn, rest sn, rest sn, rest sn,
    cHit,    rest sn, rest sn, rest sn,
    cHit,    rest sn, rest sn, rest sn,
    rest sn, rest sn, rest sn, rest sn
  ]

-- Káta Pattern (from image_ed2acc.png)
kataPattern :: Music Pitch
kataPattern = line [
    -- BAR 1
    kHit,    rest sn, rest sn, rest sn, -- Beat 1: Quarter note (hit + 3 rests)
    kHit,    rest sn, kHit,    rest sn, -- Beat 2: Two 8th notes
    rest sn, rest sn, kHit,    rest sn, -- Beat 3: 8th rest, 8th note
    rest sn, rest sn, kHit,    rest sn, -- Beat 4: 8th rest, 8th note

    -- BAR 2
    kHit,    rest sn, rest sn, rest sn, -- Beat 1: Quarter note
    kHit,    rest sn, rest sn, rest sn, -- Beat 2: Quarter note
    kHit,    rest sn, kHit,    rest sn, -- Beat 3: Two 8th notes
    rest sn, rest sn, kHit,    rest sn  -- Beat 4: 8th rest, 8th note
  ]

-- ==========================================
-- 3. ASSEMBLY & PLAYBACK
-- ==========================================

-- Combine them together in parallel using a list chord
guaguancoGroove :: Music Pitch
guaguancoGroove = chord [rumbaClave, kataPattern]

-- Infinite loop helper
loopForever :: Music a -> Music a
loopForever m = m :+: loopForever m

-- Play both patterns together at 140 BPM
main :: IO ()
main = play $ tempo (140/60) $ loopForever guaguancoGroove

-- Use 'cut 4' to cleanly extract exactly 4 bars (4 whole notes) of music
exportMidi :: IO ()
exportMidi = writeMidi "RumbaGuaguanco.midi" $ tempo (140/60) $ cut 4 $ loopForever guaguancoGroove