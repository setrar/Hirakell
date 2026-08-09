> module PitchClass where

> data Pitch
>   = C  | Cs | D  | Ds | E  | F 
>   | Fs | G  | Gs | A  | As | B
>   deriving (Eq, Show, Enum, Bounded)

> -- | Convert MIDI integer to typed Pitch value
> midiToPitch :: Int -> Pitch
> midiToPitch midi = toEnum (midi `mod` 12)

> -- | Pitch class integer representation (0 through 11)
> type PitchClass = Int

> -- | Convert a MIDI pitch number (0..127) to a PitchClass (0..11)
> toPitchClass :: Int -> PitchClass
> toPitchClass midi = midi `mod` 12

> -- | Standard note names indexed 0 through 11
> noteNames :: [String]
> noteNames = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

> -- | Convert a MIDI pitch directly to its note name string
> toNoteName :: Int -> String
> toNoteName midi = noteNames !! toPitchClass midi
