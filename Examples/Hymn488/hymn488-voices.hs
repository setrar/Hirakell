module Hymn488 where

import Euterpea

-- Tempo set to a standard 4/4 hymn pace (90 BPM)
hymnTempo :: Music Pitch -> Music Pitch
hymnTempo = tempo (90/60)

-- ==========================================
-- 1. SOPRANO (Melody Voice)
-- ==========================================
soprano :: Music Pitch
soprano = instrument ChoirAahs $ line [
    -- Verse 1
    a 4 en, g 4 sn, f 4 qn, c 4 en, f 4 en, a 4 qn, a 4 qn, g 4 en, fs 4 sn, g 4 qn, 
    bf 4 en, a 4 sn, g 4 qn, d 4 qn, g 4 qn, f 4 qn, e 4 qn, e 4 en, d 4 sn, c 4 qn,
    e 4 en, c 4 sn, f 4 qn, e 4 en, f 4 en, c 5 qn, bf 4 qn, a 4 en, a 4 sn, g 4 qn,
    bf 4 en, d 5 sn, c 5 qn, f 4 qn, bf 4 en, a 4 sn, g 4 en, f 4 sn, f 4 qn, e 4 en, e 4 sn, f 4 hn,
    -- Chorus
    c 5 en, d 5 sn, d 5 qn, a 4 qn, bf 4 qn, c 5 qn, bf 4 qn, bf 4 en, bf 4 sn, bf 4 qn,
    bf 4 en, c 5 sn, c 5 qn, g 4 qn, a 4 qn, bf 4 qn, bf 4 qn, a 4 en, gs 4 sn, a 4 qn,
    c 4 en, f 4 sn, f 4 qn, e 4 en, f 4 en, c 5 qn, bf 4 qn, a 4 en, a 4 sn, g 4 qn,
    bf 4 en, d 5 sn, c 5 qn, f 4 qn, bf 4 en, a 4 sn, g 4 en, f 4 sn, f 4 qn, e 4 en, e 4 sn, f 4 hn
    ]

-- ==========================================
-- 2. ALTO (Alto Voice)
-- ==========================================
alto :: Music Pitch
alto = instrument ChoirAahs $ line [
    -- Verse 1
    f 4 en, f 4 sn, e 4 qn, c 4 en, c 4 en, f 4 qn, f 4 qn, e 4 en, ds 4 sn, e 4 qn,
    g 4 en, f 4 sn, e 4 qn, b 3 qn, e 4 qn, d 4 qn, c 4 qn, c 4 en, b 3 sn, c 4 qn,
    c 4 en, c 4 sn, c 4 qn, c 4 en, c 4 en, e 4 qn, d 4 qn, f 4 en, f 4 sn, e 4 qn,
    g 4 en, f 4 sn, e 4 qn, d 4 qn, g 4 en, f 4 sn, e 4 en, d 4 sn, c 4 qn, c 4 en, c 4 sn, c 4 hn,
    -- Chorus
    a 4 en, f 4 sn, f 4 qn, f 4 qn, g 4 qn, g 4 qn, f 4 qn, f 4 en, f 4 sn, f 4 qn,
    g 4 en, g 4 sn, g 4 qn, e 4 qn, f 4 qn, g 4 qn, g 4 qn, f 4 en, f 4 sn, e 4 qn,
    c 4 en, c 4 sn, c 4 qn, c 4 en, c 4 en, e 4 qn, d 4 qn, f 4 en, f 4 sn, e 4 qn,
    g 4 en, f 4 sn, e 4 qn, d 4 qn, g 4 en, f 4 sn, e 4 en, d 4 sn, c 4 qn, c 4 en, c 4 sn, c 4 hn
    ]

-- ==========================================
-- 3. TENOR (Tenor Voice)
-- ==========================================
tenor :: Music Pitch
tenor = instrument VoiceOohs $ line [
    -- Verse 1
    c 4 en, b 3 sn, a 3 qn, a 3 en, a 3 en, c 4 qn, c 4 qn, b 3 en, b 3 sn, b 3 qn,
    d 4 en, c 4 sn, b 3 qn, gs 3 qn, b 3 qn, a 3 qn, g 3 qn, g 3 en, g 3 sn, e 3 qn,
    g 3 en, g 3 sn, a 3 qn, g 3 en, a 3 en, a 3 qn, f 3 qn, c 4 en, c 4 sn, b 3 qn,
    d 4 en, b 3 sn, c 4 qn, a 3 qn, d 4 en, c 4 sn, b 3 en, a 3 sn, a 3 qn, g 3 en, g 3 sn, a 3 hn,
    -- Chorus
    f 4 en, f 4 sn, d 4 qn, c 4 qn, d 4 qn, e 4 qn, d 4 qn, d 4 en, d 4 sn, d 4 qn,
    d 4 en, e 4 sn, e 4 qn, c 4 qn, c 4 qn, d 4 qn, d 4 qn, c 4 en, b 3 sn, c 4 qn,
    g 3 en, g 3 sn, a 3 qn, g 3 en, a 3 en, a 3 qn, f 3 qn, c 4 en, c 4 sn, b 3 qn,
    d 4 en, b 3 sn, c 4 qn, a 3 qn, d 4 en, c 4 sn, b 3 en, a 3 sn, a 3 qn, g 3 en, g 3 sn, a 3 hn
    ]

-- ==========================================
-- 4. BASS (Bass Voice)
-- ==========================================
bass :: Music Pitch
bass = instrument VoiceOohs $ line [
    -- Verse 1
    f 3 en, f 3 sn, f 3 qn, f 3 en, f 3 en, f 3 qn, f 3 qn, c 3 en, c 3 sn, c 3 qn,
    g 3 en, f 3 sn, e 3 qn, e 3 qn, a 3 qn, d 3 qn, g 3 qn, g 3 en, g 3 sn, c 3 qn,
    c 3 en, c 3 sn, f 3 qn, c 3 en, f 3 en, f 3 qn, d 3 qn, f 3 en, f 3 sn, c 3 qn,
    g 3 en, g 3 sn, a 3 qn, d 3 qn, b 3 en, c 4 sn, g 3 en, f 3 sn, c 3 qn, c 3 en, c 3 sn, f 3 hn,
    -- Chorus
    f 3 en, f 3 sn, bf 3 qn, f 3 qn, bf 3 qn, a 3 qn, bf 3 qn, bf 3 en, bf 3 sn, bf 3 qn,
    g 3 en, g 3 sn, c 4 qn, c 3 qn, f 3 qn, g 3 qn, b 3 qn, c 4 en, c 4 sn, c 3 qn,
    c 3 en, c 3 sn, f 3 qn, c 3 en, f 3 en, f 3 qn, d 3 qn, f 3 en, f 3 sn, c 3 qn,
    g 3 en, g 3 sn, a 3 qn, d 3 qn, b 3 en, c 4 sn, g 3 en, f 3 sn, c 3 qn, c 3 en, c 3 sn, f 3 hn
    ]

-- ==========================================
-- SATB COMBINATION WITH MIDI VOICES
-- ==========================================
fullHymn :: Music Pitch
fullHymn = hymnTempo (soprano :=: alto :=: tenor :=: bass)

-- Outputs directly to a playable MIDI file via Euterpea's engine
main :: IO ()
main = writeMidi "hymn488_satb.mid" fullHymn
