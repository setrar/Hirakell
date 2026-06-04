import Euterpea

-- Definition of the standard 6/4 Footprints bass line pattern
footprintsBassPattern :: Music Pitch
footprintsBassPattern = line [
    c 3 dqn,   -- C note, dotted quarter note
    ef 3 en,   -- E-flat note, eighth note
    f 3 qn,    -- F note, quarter note
    g 3 qn,    -- G note, quarter note
    f 3 qn,    -- F note, quarter note
    bf 2 qn    -- B-flat note, quarter note
  ]

main :: IO ()
main = play footprintsBassPattern
