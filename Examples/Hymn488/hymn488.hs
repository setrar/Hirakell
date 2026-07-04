module Hymn488 where

import Euterpea

-- Tempo set to a standard 4/4 hymn pace (e.g., 90 BPM)
hymnMelody :: Music Pitch
hymnMelody = tempo (90/60) $ line [
    -- Verse 1: "Na inona na inona hitranga, Jeso! Nany laninitra ho manga, Jeso!"
    -- :m.,r | d : s,.d | m : m | r.,di | r | f.,m | r : l, | r : d | t, : t,.,l, | s,
    a 4 en, g 4 sn,   -- :m.,r
    f 4 qn, c 4 en, f 4 en,   -- | d : s,.d
    a 4 qn, a 4 qn,   -- | m : m
    g 4 en, fs 4 sn,  -- | r.,di
    g 4 qn,           -- | r
    bf 4 en, a 4 sn,  -- | f.,m
    g 4 qn, d 4 qn,   -- | r : l,
    g 4 qn, f 4 qn,   -- | r : d
    e 4 qn, e 4 en, d 4 sn,   -- | t, : t,.,l,
    c 4 qn,           -- | s,

    -- "Na ho ma-lo-ka mangina, Je-so! Dia ho fe- no fi-fa- liana, Je-so!"
    -- :t,.,s, | d : t, .d | s : f | m.,m | r | f.,l | s : d | f.,m : r.,d | d : t,.,t, | d
    e 4 en, c 4 sn,   -- :t,.,s,
    f 4 qn, e 4 en, f 4 en,   -- | d : t, .d
    c 5 qn, bf 4 qn,  -- | s : f
    a 4 en, a 4 sn,   -- | m.,m
    g 4 qn,           -- | r
    bf 4 en, d 5 sn,  -- | f.,l
    c 5 qn, f 4 qn,   -- | s : d
    bf 4 en, a 4 sn, g 4 en, f 4 sn,  -- | f.,m : r.,d
    f 4 qn, e 4 en, e 4 sn,   -- | d : t,.,t,
    f 4 hn,           -- | d

    -- Fiverenana (Chorus): "Ny fo-toa-na dia handa-lo, Jeso! Fatsyhi-sy hampi-ma-lo, Je-so!"
    -- :s.,l | l : m | f : s | f : f.,f | f | f.,s | s : r | m : f | f : m.,ri | m
    c 5 en, d 5 sn,   -- :s.,l
    d 5 qn, a 4 qn,   -- | l : m
    bf 4 qn, c 5 qn,  -- | f : s
    bf 4 qn, bf 4 en, bf 4 sn,  -- | f : f.,f
    bf 4 qn,           -- | f
    bf 4 en, c 5 sn,  -- | f.,s
    c 5 qn, g 4 qn,   -- | s : r
    a 4 qn, bf 4 qn,  -- | m : f
    bf 4 qn, a 4 en, gs 4 sn,   -- | f : m.,ri
    a 4 qn,           -- | m

    -- "Raha mio-rina ao am-po-ko,Jeso! Lay fitia-va-nao i-noa-ko, Je-so!"
    -- :s,.,d | d : t, .d | s : f | m.,m | r | f.,l | s : d | f.,m : r.,d | d : t,.,t, | d 
    c 4 en, f 4 sn,   -- :s,.,d
    f 4 qn, e 4 en, f 4 en,   -- | d : t, .d
    c 5 qn, bf 4 qn,  -- | s : f
    a 4 en, a 4 sn,   -- | m.,m
    g 4 qn,           -- | r
    bf 4 en, d 5 sn,  -- | f.,l
    c 5 qn, f 4 qn,   -- | s : d
    bf 4 en, a 4 sn, g 4 en, f 4 sn,  -- | f.,m : r.,d
    f 4 qn, e 4 en, e 4 sn,   -- | d : t,.,t,
    f 4 hn            -- | d 
    ]

-- Play function to test in GHCi
main :: IO ()
main = play hymnMelody
