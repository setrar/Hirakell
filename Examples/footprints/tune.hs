module JazzExcerpt where
import Euterpea
import Data.Ratio ((%))

-- =========================================================================
-- 1. BASS LINE
-- =========================================================================
bassM1 :: Music Pitch
bassM1 = c 3 qn :+: g 3 qn :+: bf 3 hn :+: g 3 qn

bassM2 :: Music Pitch
bassM2 = c 3 qn :+: g 3 qn :+: bf 3 hn :+: g 3 qn

bassM3 :: Music Pitch
bassM3 = c 3 qn :+: g 3 qn :+: bf 3 hn :+: g 3 qn

bassLine :: Music Pitch
bassLine = bassM1 :+: bassM2 :+: bassM3


-- =========================================================================
-- 2. HORN SECTION
-- =========================================================================
chord2 :: Pitch -> Pitch -> Dur -> Music Pitch
chord2 p1 p2 d = note d p1 :=: note d p2

hornsM1 :: Music Pitch
hornsM1 = 
    chord2 (G, 4) (C, 5) qn :+:
    chord2 (G, 4) (C, 5) qn :+:
    chord2 (G, 4) (C, 5) qn :+:
    chord2 (Bf, 4) (D, 5) en :+:
    chord2 (G, 4) (C, 5) qn 

hornsM2 :: Music Pitch
hornsM2 = 
    let quintupletNotes = 
            chord2 (C, 5)  (Ef, 5) qn :+:
            chord2 (Bf, 4) (D, 5)  qn :+:
            chord2 (Af, 4) (C, 5)  qn :+:
            chord2 (G, 4)  (Bf, 4) qn :+:
            chord2 (F, 4)  (Af, 4) qn
    in 
    -- 'Modify' scales the time factor using 'Tempo'. 
    -- A factor of (5 % 3) speeds it up so 5 notes fit into 3 beats.
    Modify (Tempo (5 % 3)) quintupletNotes :+:
    chord2 (G, 4) (C, 5) qn 

hornsM3 :: Music Pitch
hornsM3 = 
    rest hn :+: 
    rest en :+: 
    chord2 (Af, 4) (D, 5) en :+:  
    rest qn

hornSection :: Music Pitch
hornSection = hornsM1 :+: hornsM2 :+: hornsM3


-- =========================================================================
-- 3. FULL ARRANGEMENT
-- =========================================================================
mainComposition :: Music Pitch
mainComposition = instrument Trumpet hornSection :=: instrument ElectricBassFingered bassLine

playJazz :: IO ()
playJazz = play (tempo 120 mainComposition)
