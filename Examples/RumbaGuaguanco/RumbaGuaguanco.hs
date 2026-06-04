module Main where

import Euterpea

-- ==========================================
-- 1. INSTRUMENT DEFINITIONS
-- ==========================================

clv :: PercussionSound
clv = HiWoodBlock

-- Short helper to keep code readable
hit :: Music Pitch
hit = perc clv sn

-- ==========================================
-- 2. RHYTHMIC PATTERN (From Image)
-- ==========================================

rumbaClave :: Music Pitch
rumbaClave = line [
    -- ----------------------------------------------------
    -- BAR 1 (The 3-Side)
    -- ----------------------------------------------------
    hit,     rest sn, rest sn, rest sn, -- Beat 1: Hit on downbeat
    rest sn, rest sn, hit,     rest sn, -- Beat 2: Hit on the "and"
    rest sn, rest sn, rest sn, rest sn, -- Beat 3: All rests
    rest sn, rest sn, hit,     rest sn, -- Beat 4: Hit on the "and"

    -- ----------------------------------------------------
    -- BAR 2 (The 2-Side)
    -- ----------------------------------------------------
    rest sn, rest sn, rest sn, rest sn, -- Beat 1: All rests
    hit,     rest sn, rest sn, rest sn, -- Beat 2: Hit on downbeat
    hit,     rest sn, rest sn, rest sn, -- Beat 3: Hit on downbeat
    rest sn, rest sn, rest sn, rest sn  -- Beat 4: All rests
  ]

-- ==========================================
-- 3. PLAYBACK
-- ==========================================

-- Infinite loop helper
loopForever :: Music a -> Music a
loopForever m = m :+: loopForever m

-- Play the pattern at 140 BPM (typical for Guaguancó)
main :: IO ()
main = play $ tempo (140/60) $ loopForever rumbaClave