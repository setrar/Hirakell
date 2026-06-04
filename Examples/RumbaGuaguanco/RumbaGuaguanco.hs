module Main where

import Euterpea

-- ==========================================
-- 1. INSTRUMENT DEFINITIONS
-- ==========================================

clvInstr :: PercussionSound
clvInstr = HiWoodBlock

katInstr :: PercussionSound
katInstr = LowWoodBlock

congaMute :: PercussionSound
congaMute = MuteHiConga

congaOpen :: PercussionSound
congaOpen = OpenHiConga

tumbaLow :: PercussionSound
tumbaLow = LowConga

-- Short helpers to keep the 16th-note grid clean
clvH :: Music Pitch
clvH = perc clvInstr sn

katH :: Music Pitch
katH = perc katInstr sn

conM :: Music Pitch
conM = perc congaMute sn

conO :: Music Pitch
conO = perc congaOpen sn

tumL :: Music Pitch
tumL = perc tumbaLow sn

-- ==========================================
-- 2. RHYTHMIC PATTERNS
-- ==========================================

-- Clave Pattern
rumbaClave :: Music Pitch
rumbaClave = line [
    -- BAR 1
    clvH,    rest sn, rest sn, rest sn,
    rest sn, rest sn, clvH,    rest sn,
    rest sn, rest sn, rest sn, rest sn,
    rest sn, rest sn, clvH,    rest sn,
    -- BAR 2
    rest sn, rest sn, rest sn, rest sn,
    clvH,    rest sn, rest sn, rest sn,
    clvH,    rest sn, rest sn, rest sn,
    rest sn, rest sn, rest sn, rest sn
  ]

-- Káta Pattern
kataPattern :: Music Pitch
kataPattern = line [
    -- BAR 1
    katH,    rest sn, rest sn, rest sn,
    katH,    rest sn, katH,    rest sn,
    rest sn, rest sn, katH,    rest sn,
    rest sn, rest sn, katH,    rest sn,
    -- BAR 2
    katH,    rest sn, rest sn, rest sn,
    katH,    rest sn, rest sn, rest sn,
    katH,    rest sn, katH,    rest sn,
    rest sn, rest sn, katH,    rest sn
  ]

-- Congas & Tumbadora Pattern (from image_ed10a5.png)
congaPattern :: Music Pitch
-- congaPattern = line [
--     -- BAR 1
--     conO,    rest sn, conM,    rest sn, -- Beat 1: Open, Mute (8th notes)
--     rest sn, rest sn, conM,    rest sn, -- Beat 2: 8th rest, Mute
--     conO,    conO,    rest sn, rest sn, -- Beat 3: Two 16th opens, rest
--     tumL,    rest sn, rest sn, rest sn, -- Beat 4: Accented Low Tumbadora!

--     -- BAR 2
--     conO,    rest sn, conM,    rest sn, -- Beat 1: Open, Mute
--     rest sn, rest sn, conM,    rest sn, -- Beat 2: 8th rest, Mute
--     conO,    conO,    rest sn, rest sn, -- Beat 3: Two 16th opens, rest
--     conO,    rest sn, rest sn, rest sn  -- Beat 4: Resolves on Middle Open
--   ]
congaPattern = line [
    -- BAR 1
    rest qn, -- Beat 1: 4th rest
    rest qn, -- Beat 2: 4th rest
    rest qn, -- Beat 3: 4th rest
    -- tumL,    rest sn, rest sn, rest sn, -- Beat 4: Accented Low Tumbadora!
    rest qn, -- Beat 4: 4th rest

    -- BAR 2
    rest sn, -- Beat 1: 4th rest
    conO,    rest sn, conM,    rest sn, -- Beat 1: Open, Mute (8th notes)
    tumL,    rest sn, rest sn, rest sn, -- Beat 3: Accented Low Tumbadora!
    rest qn, -- Beat 3: 4th rest
    -- conO,    rest sn, rest sn, rest sn  -- Beat 4: Resolves on Middle Open
    rest sn -- Beat 4: 4th rest
  ]

-- ==========================================
-- 3. ASSEMBLY & PLAYBACK
-- ==========================================

-- Combine all 3 layers in parallel
guaguancoGroove :: Music Pitch
guaguancoGroove = chord [rumbaClave, kataPattern, congaPattern]

-- Infinite loop helper
loopForever :: Music a -> Music a
loopForever m = m :+: loopForever m

-- Play the full traditional ensemble at 140 BPM
main :: IO ()
main = play $ tempo (140/60) $ loopForever guaguancoGroove

-- Use 'cut 4' to cleanly extract exactly 4 bars (4 whole notes) of music
exportMidi :: IO ()
exportMidi = writeMidi "RumbaGuaguanco.midi" $ tempo (140/60) $ cut 4 $ loopForever guaguancoGroove