module ScoreTranscription where

import Euterpea

-- Right Hand (Treble Clef)
trebleVoice :: Music Pitch
trebleVoice = 
  -- System 1: C - G/B - C - A/Cs | Dm - A/Cs - Dm - B/Ds | Em - B/Ds - Em - C/E | F - C/E - F - D/Fs
  ( chord [c 4 qn, e 4 qn, g 4 qn] :=: chord [c 5 qn, e 5 qn] ) :+: ( chord [b 2 qn, d 3 qn, g 3 qn] :=: chord [b 4 qn, d 5 qn] ) :+: 
  ( chord [c 4 qn, e 4 qn, g 4 qn] :=: chord [c 5 qn, e 5 qn] ) :+: ( chord [cs 4 qn, e 4 qn, a 4 qn] :=: chord [cs 5 qn, e 5 qn] ) :+:
  ( chord [d 4 qn, f 4 qn, a 4 qn] :=: chord [d 5 qn, f 5 qn] ) :+: ( chord [cs 4 qn, e 4 qn, a 4 qn] :=: chord [cs 5 qn, e 5 qn] ) :+: 
  ( chord [d 4 qn, f 4 qn, a 4 qn] :=: chord [d 5 qn, f 5 qn] ) :+: ( chord [ds 4 qn, fs 4 qn, b 4 qn] :=: chord [ds 5 qn, fs 5 qn] ) :+:
  ( chord [e 4 qn, g 4 qn, b 4 qn] :=: chord [e 5 qn, g 5 qn] ) :+: ( chord [ds 4 qn, fs 4 qn, b 4 qn] :=: chord [ds 5 qn, fs 5 qn] ) :+: 
  ( chord [e 4 qn, g 4 qn, b 4 qn] :=: chord [e 5 qn, g 5 qn] ) :+: ( chord [e 4 qn, g 4 qn, c 5 qn] :=: chord [e 5 qn, g 5 qn] ) :+:
  ( chord [f 4 qn, a 4 qn, c 5 qn] :=: chord [f 5 qn, a 5 qn] ) :+: ( chord [e 4 qn, g 4 qn, c 5 qn] :=: chord [e 5 qn, g 5 qn] ) :+: 
  ( chord [f 4 qn, a 4 qn, c 5 qn] :=: chord [f 5 qn, a 5 qn] ) :+: ( chord [fs 4 qn, a 4 qn, d 5 qn] :=: chord [fs 5 qn, a 5 qn] ) :+:

  -- System 2: G - D/Fs - G - E/Gs | Am - E/Gs - Am - G/B | C - E/Gs - Am - D/Fs | G - C/E - F - B/Ds
  ( chord [g 4 qn, b 4 qn, d 5 qn] :=: chord [g 5 qn, b 5 qn] ) :+: ( chord [fs 4 qn, a 4 qn, d 5 qn] :=: chord [fs 5 qn, a 5 qn] ) :+: 
  ( chord [g 4 qn, b 4 qn, d 5 qn] :=: chord [g 5 qn, b 5 qn] ) :+: ( chord [gs 4 qn, b 4 qn, e 5 qn] :=: chord [gs 5 qn, b 5 qn] ) :+:
  ( chord [a 4 qn, c 5 qn, e 5 qn] :=: chord [a 5 qn, c 6 qn] ) :+: ( chord [gs 4 qn, b 4 qn, e 5 qn] :=: chord [gs 5 qn, b 5 qn] ) :+: 
  ( chord [a 4 qn, c 5 qn, e 5 qn] :=: chord [a 5 qn, c 6 qn] ) :+: ( chord [g 4 qn, b 4 qn, d 5 qn] :=: chord [g 5 qn, b 5 qn] ) :+:
  ( chord [c 5 qn, e 5 qn, g 5 qn] :=: chord [c 6 qn, e 6 qn] ) :+: ( chord [gs 4 qn, b 4 qn, e 5 qn] :=: chord [gs 5 qn, b 5 qn] ) :+: 
  ( chord [a 4 qn, c 5 qn, e 5 qn] :=: chord [a 5 qn, c 6 qn] ) :+: ( chord [fs 4 qn, a 4 qn, d 5 qn] :=: chord [fs 5 qn, a 5 qn] ) :+:
  ( chord [g 4 qn, b 4 qn, d 5 qn] :=: chord [g 5 qn, b 5 qn] ) :+: ( chord [e 4 qn, g 4 qn, c 5 qn] :=: chord [e 5 qn, g 5 qn] ) :+: 
  ( chord [f 4 qn, a 4 qn, c 5 qn] :=: chord [f 5 qn, a 5 qn] ) :+: ( chord [ds 4 qn, fs 4 qn, b 4 qn] :=: chord [ds 5 qn, fs 5 qn] ) :+:

  -- System 3: Em - A/Cs - Dm - G/B - C (final whole notes)
  ( chord [e 4 qn, g 4 qn, b 4 qn] :=: chord [e 5 qn, g 5 qn] ) :+:
  ( chord [cs 4 qn, e 4 qn, a 4 qn] :=: chord [cs 5 qn, e 5 qn] ) :+:
  ( chord [d 4 qn, f 4 qn, a 4 qn] :=: chord [d 5 qn, f 5 qn] ) :+:
  ( chord [g 4 qn, b 4 qn, d 5 qn] :=: chord [g 5 qn, b 5 qn] ) :+:
  ( chord [c 4 hn, e 4 hn, g 4 hn] :=: chord [c 5 hn, e 5 hn] )

-- Left Hand (Bass Clef)
bassVoice :: Music Pitch
bassVoice = 
  -- System 1
  c 3 qn :+: b 2 qn :+: c 3 qn :+: cs 3 qn :+:
  d 3 qn :+: cs 3 qn :+: d 3 qn :+: ds 3 qn :+:
  e 3 qn :+: ds 3 qn :+: e 3 qn :+: c 3 qn :+:
  f 3 qn :+: c 3 qn :+: f 3 qn :+: fs 3 qn :+:

  -- System 2
  g 3 qn :+: fs 3 qn :+: g 3 qn :+: gs 3 qn :+:
  a 3 qn :+: gs 3 qn :+: a 3 qn :+: g 3 qn :+:
  c 3 qn :+: gs 3 qn :+: a 3 qn :+: d 3 qn :+:
  g 2 qn :+: c 3 qn :+: f 3 qn :+: b 2 qn :+:

  -- System 3
  e 3 qn :+:
  cs 3 qn :+:
  d 3 qn :+:
  g 2 qn :+:
  c 3 hn

-- Combined Grand Staff Score
fullScore :: Music Pitch
fullScore = trebleVoice :=: bassVoice
