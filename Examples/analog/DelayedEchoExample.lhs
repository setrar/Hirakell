> {-# LANGUAGE Arrows #-}
> 
> import Euterpea
> import Euterpea.IO.Audio

The `instr` function generates a sine wave and shapes its volume using `envLineSeg`.
By applying the envelope to the oscillator before feeding it into `delayLine`, the dry sound fades out while allowing the 0.5-second echo tail to render into the output file.

> instr :: Instr (Stereo AudRate)
> instr dur ap _vol _params =
>     let decayDur = fromRational dur / 2  -- Calculate half the note's duration (0.25s for qn)
>         tailDur  = decayDur + 1.0        -- Extend envelope lifetime so the signal stays active for the delay echo
>     in proc _ -> do
>         -- Ramp envelope: Starts at 1.0, decays to 0.0 over 'decayDur', then stays at 0.0 for 'tailDur'
>         env <- envLineSeg [1.0, 0.0, 0.0] [decayDur, tailDur] -< ()
>         
>         -- Generate a pure sine wave at the note's frequency
>         x <- oscFixed (apToHz ap) -< ()
>         
>         -- Shape the raw oscillator with the decay envelope to create the dry signal
>         let dry = x * env
>         
>         -- Feed the shaped dry signal into a 0.5-second delay buffer
>         y <- delayLine 0.5 -< dry
>         
>         -- Combine dry signal with 50% wet echo, outputting to both left and right stereo channels
>         outA -< (dry + 0.5 * y, dry + 0.5 * y)

In `main`, we sequence a quarter note with a half rest (`rest hn`) to ensure the rendering loop stays open long enough to capture the delayed echo tail.

> main :: IO ()
> main =
>     writeWav
>         "delay.wav"                       -- Output WAV filename
>         [(AcousticGrandPiano, instr)]     -- Map the piano instrument slot to our custom signal function
>         (note qn (C, 4 :: Octave) :+: rest hn) -- Play C4 quarter note followed by a half note rest