This example demonstrates how to use Euterpea's built-in
`delayLine` signal processor to create a simple echo effect.

We begin by enabling Arrow notation.

> {-# LANGUAGE Arrows #-}

Import Euterpea and its audio facilities.

> import Euterpea
> import Euterpea.IO.Audio

The instrument generates a sine wave whose frequency is
determined by the pitch being played.

The signal is sent through a 0.5-second delay line and
mixed with the original signal to create an echo effect.

> instr :: Instr (Stereo AudRate)
> instr _dur ap _vol _params =
>     proc _ -> do
>         x <- oscFixed (apToHz ap) -< ()
>         y <- delayLine 0.5 -< x
>         outA -< (x + 0.5 * y, x + 0.5 * y)

Generate a WAV file containing a quarter-note middle C.

`Octave` is specified explicitly to avoid type ambiguity.

> main :: IO ()
> main =
>     writeWav
>         "delay.wav"
>         [(AcousticGrandPiano, instr)]
>         (note qn (C, 4 :: Octave))