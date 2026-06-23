import Euterpea

-- Defines a C major pentatonic scale as quarter notes.
cMajorPentatonic :: Music Pitch
cMajorPentatonic = 
    c 4 qn :+: d 4 qn :+: e 4 qn :+: g 4 qn :+: a 4 qn :+: c 5 qn
