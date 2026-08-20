> {-# LANGUAGE Arrows #-}
> 
> import Euterpea
> import Euterpea.IO.Audio

`envLineSeg` takes a list of values and a list of durations: 
`envLineSeg [startVal, endVal] [duration]` creates a smooth linear decay over `dur` seconds.

> instr :: Instr (Stereo AudRate)
> instr dur ap _vol _params =
>     proc _ -> do
>         -- Envelope that decays from 1.0 to 0.0 over the note's duration
>         env <- envLineSeg [1.0, 0.0] [fromRational dur] -< ()
>         
>         -- Generate the pure sine wave at the target frequency
>         x <- oscFixed (apToHz ap) -< ()
>         
>         -- Apply the decay envelope ONLY to the raw sound source
>         let dry = x * env
>         
>         -- Pass the decaying dry signal into the 0.5-second delay buffer
>         y <- delayLine 0.5 -< dry
>         
>         -- Mix dry tone and echo
>         outA -< (dry + 0.5 * y, dry + 0.5 * y)

In `main`, sequence the quarter note with a half rest (`rest hn`) using `(:+:)` to give the 0.5-second echo time to complete.

> main :: IO ()
> main =
>     writeWav
>         "delay.wav"
>         [(AcousticGrandPiano, instr)]
>         (note qn (C, 4 :: Octave) :+: rest hn)