module LeCommerceFull where

import Euterpea

-- =============================================================================
-- Global Structure
-- =============================================================================

tempoBPM :: Music Pitch -> Music Pitch
tempoBPM = tempo (110 / 60) -- 110 BPM

-- =============================================================================
-- Instrument Parts (Measures 1-2)
-- =============================================================================

-- Trumpet Part (Trp.)
trumpetLine :: Music Pitch
trumpetLine = instrument Trumpet $ 
  -- Measure 1
  (g 4 en :+: snr :+: g 4 sn :+: a 4 sn :+: b 4 sn :+: enr) :+: 
  (g 4 sn :+: a 4 sn :+: b 4 sn :+: c 5 sn :+: d 5 en :+: qnr) :+:
  -- Measure 2
  (d 5 en :+: d 5 en :+: d 5 en :+: qnr) :+:
  (fs 4 sn :+: g 4 sn :+: a 4 sn :+: b 4 sn :+: c 5 sn :+: d 5 sn :+: enr)

-- Trombone Part (Trb.)
tromboneLine :: Music Pitch
tromboneLine = instrument Trombone $
  -- Measure 1
  (d 4 en :+: snr :+: d 4 sn :+: d 4 sn :+: d 4 sn :+: enr) :+:
  (d 4 sn :+: cs 4 sn :+: d 4 sn :+: e 4 sn :+: f 4 en :+: qnr) :+:
  -- Measure 2
  (f 4 en :+: f 4 en :+: f 4 en :+: qnr) :+:
  (d 4 sn :+: d 4 sn :+: d 4 sn :+: d 4 sn :+: d 4 sn :+: d 4 sn :+: enr)

-- Saxophone 1 Part (Sax 1)
sax1Line :: Music Pitch
sax1Line = instrument AltoSax $
  -- Measure 1
  (b 4 en :+: snr :+: b 4 sn :+: c 5 sn :+: d 5 sn :+: enr) :+: 
  (b 4 sn :+: c 5 sn :+: d 5 sn :+: e 5 sn :+: f 5 en :+: qnr) :+:
  -- Measure 2
  (f 5 en :+: f 5 en :+: f 5 en :+: qnr) :+:
  (a 4 sn :+: b 4 sn :+: c 5 sn :+: d 5 sn :+: e 5 sn :+: f 5 sn :+: enr)

-- Saxophone 2 Part (Sax 2)
sax2Line :: Music Pitch
sax2Line = instrument AltoSax $
  -- Measure 1
  (g 4 en :+: snr :+: g 4 sn :+: g 4 sn :+: g 4 sn :+: enr) :+:
  (g 4 sn :+: fs 4 sn :+: g 4 sn :+: a 4 sn :+: b 4 en :+: qnr) :+:
  -- Measure 2
  (b 4 en :+: b 4 en :+: b 4 en :+: qnr) :+:
  (g 4 sn :+: g 4 sn :+: g 4 sn :+: g 4 sn :+: g 4 sn :+: g 4 sn :+: enr)

-- Piano Part
pianoLine :: Music Pitch
pianoLine = instrument AcousticGrandPiano $
  -- Measure 1
  (g 3 qn :=: b 3 qn :=: d 4 qn :=: g 4 qn) :+: qnr :+: qnr :+: qnr :+:
  -- Measure 2
  qnr :+: (enr :+: (g 3 en :=: b 3 en :=: d 4 en :=: g 4 en)) :+: 
  (g 3 en :=: b 3 en :=: d 4 en :=: g 4 en) :+: qnr

-- Bass Line (Bass)
bassLine :: Music Pitch
bassLine = instrument SlapBass1 $
  -- Measure 1
  (g 2 sn :+: g 2 sn :+: enr) :+: (g 2 sn :+: fs 2 sn :+: g 2 sn :+: a 2 sn) :+: 
  (b 2 sn :+: c 3 sn :+: enr) :+: (d 3 sn :+: d 3 sn :+: enr) :+:
  -- Measure 2
  (g 2 sn :+: g 2 sn :+: enr) :+: (g 2 sn :+: f 2 sn :+: g 2 sn :+: a 2 sn) :+:
  (b 2 en :+: c 3 en :+: d 3 qn)

-- =============================================================================
-- Percussion Part (Drums)
-- =============================================================================

drumLine :: Music Pitch
drumLine = 
  -- Measure 1
  (perc AcousticBassDrum qn) :+: 
  (perc ClosedHiHat en :=: perc AcousticSnare en) :+: 
  (perc ClosedHiHat sn :+: perc ClosedHiHat sn :+: perc AcousticSnare en) :+:
  (perc ClosedHiHat en :=: perc AcousticSnare en) :+:
  -- Measure 2
  (perc AcousticBassDrum en :=: perc AcousticSnare en) :+:
  (perc ClosedHiHat sn :+: perc ClosedHiHat sn :+: perc AcousticSnare en) :+:
  (perc ClosedHiHat en :=: perc AcousticSnare en) :+:
  (perc ClosedHiHat en :=: perc AcousticSnare en)

-- =============================================================================
-- Main Composition Setup
-- =============================================================================

mainScore :: Music Pitch
mainScore = tempoBPM $ 
  trumpetLine 
  :=: tromboneLine 
  :=: sax1Line
  :=: sax2Line
  :=: pianoLine 
  :=: bassLine
  :=: drumLine