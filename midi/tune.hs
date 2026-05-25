import Euterpea

-- ==========================================
-- 1. TRACK 1: The Marimba Bassline (Ostinato)
-- ==========================================
-- We build a basic walking bass pattern using Eighth notes (en) and Quarter notes (qn)
marimbaPattern :: Music Pitch
marimbaPattern = line [ c 3 en, g 3 en, c 4 qn
                      , f 3 en, c 4 en, f 4 qn
                      , g 3 en, d 4 en, g 4 qn
                      , c 3 en, g 3 en, c 4 qn ]

-- Assign the physical General MIDI Marimba instrument to the loop
bassTrack :: Music Pitch
bassTrack = instrument Marimba marimbaPattern


-- ==========================================
-- 2. TRACK 2: The Ambient Organ Chords
-- ==========================================
-- A slow, evolving chord progression using half notes (hn) and whole notes (wn)
organChords :: Music Pitch
organChords = line [ chord [c 4 hn, e 4 hn, g 4 hn]  -- C Major
                   , chord [f 4 hn, a 4 hn, c 5 hn]  -- F Major
                   , chord [g 4 hn, b 4 hn, d 5 hn]  -- G Major
                   , chord [c 4 wn, e 4 wn, c 5 wn]  -- Resolution
                   ]

-- Assign the physical General MIDI Church Organ instrument to the chords
melodyTrack :: Music Pitch
melodyTrack = instrument ChurchOrgan organChords


-- ==========================================
-- 3. THE MIX: Parallel Composition
-- ==========================================
-- We use standard mathematical addition via (:=:) to layer them in parallel time
simpleTune :: Music Pitch
simpleTune = bassTrack :=: melodyTrack

main :: IO ()
main = do
  putStrLn "Playing our 2-instrument composition..."
  play simpleTune
