module BarryHarris where
import Euterpea

barryC7Ascending :: Music Pitch
barryC7Ascending = 
    note en (C, 4)  :+: note en (Cs, 4) :+: -- C  to C#
    note en (D, 4)  :+: note en (Ds, 4) :+: -- D  to D#
    note en (E, 4)  :+: note en (G, 4)  :+: -- E  to G (The Leap!)
    note en (F, 4)  :+: note en (Fs, 4) :+: -- F  to F#
    note en (G, 4)  :+: note en (Gs, 4) :+: -- G  to G#
    note en (A, 4)  :+: note en (C, 5)  :+: -- A  to C (The Leap!)
    note en (As, 4) :+: note en (B, 4)  :+: -- A# to B 
    note qn (C, 5)                          -- Resolve to high C

-- Barry's Beautiful Chromatic Scale on D7 as taught by Chris Parks
barryD7Ascending :: Music Pitch
barryD7Ascending = 
    note en (D, 4)  :+: note en (Ds, 4) :+: -- D to D#
    note en (E, 4)  :+: note en (F, 4)  :+: -- E to F
    note en (Fs, 4) :+: note en (A, 4)  :+: -- F# to A (The Jump)
    note en (G, 4)  :+: note en (Gs, 4) :+: -- G to G#
    note en (A, 4)  :+: note en (As, 4) :+: -- A to A#
    note en (B, 4)  :+: note en (D, 5)  :+: -- B to D (The Jump)
    note en (C, 5)  :+: note en (Cs, 5) :+: -- C to C#
    note qn (D, 5)                          -- Resolve straight to high D

-- The combined unison performance
-- Both lines run simultaneously using the :=: operator
barryC7Unison :: Music Pitch
barryC7Unison = barryC7Ascending :=: transpose 4 barryC7Ascending

main :: IO ()
main = do
--    play (tempo 130 (instrument AcousticGrandPiano barryC7Ascending))
    play $ instrument AcousticGrandPiano barryC7Unison