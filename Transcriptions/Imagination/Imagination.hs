module Imagination where
import Euterpea

melody :: Music Pitch
melody = 
  -- Exact Pickup Alignment
  rest hn :+: rest en :+: d 4 en :+: ef 4 en :+: f 4 en :+:                -- pickup: "Im-ag-i-"
  
  -- Bars 1-4
  g 4 qn :+: g 4 hn :+: bf 4 qn :+:                                        -- Bar 1: "na-tion is "
  af 4 qn :+: af 4 hn :+: c 5 qn :+:                                       -- Bar 2: "fun-ny, It"
  bf 4 qn :+: bf 4 qn :+: tempo (3/2) (bf 4 qn :+: c 5 qn :+: df 5 qn) :+: -- Bar 3: "makes a cloud-y day"
  bf 4 qn :+: bf 4 dhn :+:                                                 -- Bar 4: "sun-ny."

  -- Bars 5-8 with Legato/Slur phrasing
  af 4 qn :+: af 4 qn :+: tempo (3/2) (af 4 qn :+: bf 4 qn :+: c 5 qn) :+: -- Bar 5: "Makes a bee think of"
  af 4 qn :+: af 4 qn :+: c 5 qn :+: phrase [Art (Slurred (11/10))] (
    bf 4 en :+: g 4 en :+:                                                 -- Bar 6 end: "hon-ey. Just as I"
    g 4 hn                                                                 -- Bar 7 downbeat: "think"
  ) :+: bf 4 qn :+: phrase [Art (Slurred (11/10))] (
    af 4 en :+: f 4 en :+:                                                 -- Bar 7 end: "of you, ----"
    f 4 hn                                                                 -- Bar 8 downbeat: "(slur)"
  ) :+: rest en :+: d 4 en :+: ef 4 en :+: f 4 en :+:                      -- Bar 8 rest & pickup: "Im-ag-i-"
  
  -- Bars 9-12 (Repetition of the corrected A pattern)
  g 4 qn :+: g 4 hn :+: bf 4 qn :+:                          -- Bar 1: "na-tion is "
  af 4 qn :+: af 4 hn :+: c 5 qn :+:                         -- Bar 2: "fun-ny, It"
  bf 4 qn :+: bf 4 qn :+: tempo (3/2) (bf 4 qn :+: c 5 qn :+: df 5 qn) :+: -- Bar 3: "makes a cloud-y day"
  bf 4 qn :+: bf 4 dhn :+:                                   -- Bar 4: "sun-ny."

  -- Bars 13-16
  c 5 qn :+: bf 4 qn :+: c 5 qn :+: bf 4 qn :+:         
  af 4 hn :+: g 4 qn :+: f 4 qn :+:                     
  g 4 qn :+: f 4 qn :+: g 4 hn :+:                      
  rest wn                                               

-- Harmony
harmony :: Music Pitch
harmony = 
  rest wn :+: -- Matches the pickup measure
  
  -- Bars 1-4
  (ef 3 hn :=: g 3 hn :=: bf 3 hn :=: d 4 hn) :+: (e 3 hn :=: g 3 hn :=: bf 3 hn :=: df 4 hn) :+:
  (f 3 hn :=: af 3 hn :=: c 4 hn :=: ef 4 hn) :+: (bf 2 hn :=: d 3 hn :=: f 3 hn :=: af 3 hn) :+:
  (ef 3 hn :=: g 3 hn :=: bf 3 hn :=: d 4 hn) :+: (af 2 hn :=: c 3 hn :=: ef 3 hn :=: g 3 hn) :+:
  (g 3 hn :=: bf 3 hn :=: df 4 hn :=: f 4 hn) :+: (c 3 hn :=: e 3 hn :=: g 3 hn :=: bf 3 hn) :+:
  -- Bars 5-8
  (f 3 hn :=: af 3 hn :=: c 4 hn) :+: (c 3 hn :=: e 3 hn :=: g 3 hn :=: bf 3 hn) :+:
  (f 3 hn :=: af 3 hn :=: c 4 hn :=: ef 4 hn) :+: (bf 2 hn :=: d 3 hn :=: f 3 hn :=: af 3 hn) :+:
  (g 3 hn :=: b 3 hn :=: d 4 hn :=: f 4 hn) :+: (c 3 hn :=: e 3 hn :=: g 3 hn :=: bf 3 hn) :+:
  (f 3 hn :=: af 3 hn :=: c 4 hn :=: ef 4 hn) :+: (bf 2 hn :=: d 3 hn :=: f 3 hn :=: af 3 hn) :+:
  -- Bars 9-12
  (ef 3 hn :=: g 3 hn :=: bf 3 hn :=: d 4 hn) :+: (e 3 hn :=: g 3 hn :=: bf 3 hn :=: df 4 hn) :+:
  (f 3 hn :=: af 3 hn :=: c 4 hn :=: ef 4 hn) :+: (bf 2 hn :=: d 3 hn :=: f 3 hn :=: af 3 hn) :+:
  (ef 3 hn :=: g 3 hn :=: bf 3 hn :=: d 4 hn) :+: (af 2 hn :=: c 3 hn :=: ef 3 hn :=: g 3 hn) :+:
  (g 3 hn :=: bf 3 hn :=: df 4 hn :=: f 4 hn) :+: (c 3 hn :=: e 3 hn :=: g 3 hn :=: bf 3 hn) :+:
  -- Bars 13-16
  (f 3 hn :=: af 3 hn :=: c 4 hn) :+: (c 3 hn :=: e 3 hn :=: g 3 hn :=: bf 3 hn) :+:
  (f 3 hn :=: af 3 hn :=: c 4 hn :=: ef 4 hn) :+: (bf 2 hn :=: d 3 hn :=: f 3 hn :=: af 3 hn) :+:
  (ef 3 wn :=: g 3 wn :=: bf 3 wn :=: d 4 wn) :+:
  (bf 2 hn :=: df 3 hn :=: f 3 hn :=: af 3 hn) :+: (ef 3 hn :=: g 3 hn :=: bf 3 hn :=: df 4 hn)

entirePiece :: Music Pitch
entirePiece = melody :=: harmony

main :: IO ()
main = play entirePiece