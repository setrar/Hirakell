module TakeFive where

import Euterpea

-- Helper function to repeat a music block a specific number of times
repeatMusic :: Int -> Music Pitch -> Music Pitch
repeatMusic n m
  | n <= 0    = rest 0
  | n == 1    = m
  | otherwise = m :+: repeatMusic (n - 1) m

-- 1. The 5/4 Bass Line (Eb Minor)
-- Follows a 3+2 pattern, accenting beats 1, 4, and 5
bassBar :: Music Pitch
bassBar = line [
    ef 2 qn,   -- Beat 1: Root (E-flat)
    gf 2 qn,   -- Beat 2: Minor 3rd (G-flat)
    bf 2 qn,   -- Beat 3: The 5th (B-flat)
    df 2 qn,   -- Beat 4: The Minor 7th (D-flat)
    bf 2 qn    -- Beat 5: Resolves back to the 5th
  ]

bassLine :: Music Pitch
bassLine = instrument AcousticBass (rest qn :+: repeatMusic 4 bassBar)

-- 2. The 5/4 Drum Pattern
drumBar :: Music Pitch
drumBar = let 
    ride  = perc RideCymbal1
    snare = perc AcousticSnare
    kick  = perc BassDrum1
  in line [
    ride qn :=: kick qn,              -- Beat 1: Ride + Kick anchor
    ride en :+: ride en :=: snare qn, -- Beat 2: Swing cymbal + light snare
    ride qn,                          -- Beat 3: Steady ride
    ride qn :=: kick qn,              -- Beat 4: Kick accents the "2" section shift
    ride en :+: ride en               -- Beat 5: Swing cymbal resolution
  ]

drumLine :: Music Pitch
drumLine = instrument Percussion (repeatMusic 4 drumBar)

-- 3. The Full Mix
-- Combines bass and drums in parallel (:=:) at 170 BPM
takeFive :: Music Pitch
takeFive = tempo (170/60) (bassLine :=: drumLine)

-- Main function to run directly via 'runHaskell TakeFive.hs' or inside GHCi
main :: IO ()
main = play takeFive
