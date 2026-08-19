module Main where

import Euterpea

-- Euterpea Melody: "Tenderly" Lead Sheet
-- Time Signature: 4/4
-- Key Signature: Eb Major

tenderly :: Music Pitch
tenderly = tempo (4/4) $ line [
    -- Pickup Measure (4 beats)
    hnr, enr, bf 4 en, c 5 en, ef 5 en,
    
    -- Section A
    -- m1: EbMA7 (4 beats)
    d 5 (hn + en), bf 4 en, c 5 en, ef 5 en,
    -- m2: Ab9(#11) (4 beats)
    d 5 (hn + qn), bf 4 en, gf 4 en,

    -- m3-m4: EbMI9 | Ab13 (8 beats total)
    f 4 (wn + hn), enr, ef 4 en, f 4 en, af 4 en,

    -- m5-m6: FMI9 | Db9(#11)
    bf 4 (hn + en), af 4 en, f 4 en, af 4 en, f 5 (hn + qn), g 4 qn,
    -- m7-m8: EbMA7 | (Gm7 C7)
    ef 4 (hn + hn), ef 4 (hn + qn), g 4 qn,

    -- m9-m10: FMI7(b5) | Bb13
    d 4 qn, f 4 qn, af 4 qn, c 5 qn,
    -- m11-m12: FMI7(b5) | Bb13 Bb7
    b 4 qn, af 4 qn, f 4 qn, ef 4 qn,
    -- m13-m14: CMI7 | F13
    g 4 qn, c 5 qn, a 4 (hn + qn), g 4 qn,
    -- m15-m16: FMI7 | Bb7
    f 4 hn, g 4 en, af 4 en, bf 4 en, c 5 (hn + qn), g 4 qn,

    -- Section B
    -- m17-m18: EbMA7 | Ab9(#11)
    d 5 (hn + en), bf 4 en, c 5 en, ef 5 en,
    d 5 (hn + en), bf 4 en, gf 4 en, g 4 en,
    
    -- m19-m20: EbMI9 | Ab13
    f 4 (wn + hn), enr, ef 4 en, f 4 en, af 4 en,

    -- m21-m22: FMI9 | Db9(#11)
    bf 4 (hn + en), af 4 en, f 4 en, af 4 en, f 5 (hn + qn), g 4 qn,
    -- m23-m24: EbMA7 | (Gm7 C7)
    ef 4 (hn + hn), ef 4 (hn + qn), g 4 qn,

    -- m25-m26: FMI7(b5) | Bb13 Bb7
    d 4 qn, f 4 qn, af 4 qn, c 5 qn,
    -- m27-m28: CMI7 | F13 F#o7
    ef 5 qn, d 5 qn, c 5 (hn + hn),
    -- m29-m30: GMI7 C7(b5) | FMI9 Bb7
    bf 4 qn, af 4 en, g 4 en, af 4 qn, g 4 en, f 4 en,
    -- m31-m32: Eb6 | (Fm7 Bb7)
    ef 4 (hn + hn), ef 4 (hn + hn)
  ]

main :: IO ()
main = playDev 7 tenderly