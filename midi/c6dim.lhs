This script writes a diminished progression layout out to a MIDI file.

> import Euterpea

Here is the underlying musical phrase logic.

> music = c 4 qn :=: e 4 qn :+: d 4 qn :=: f 4 qn :+:
>         e 4 qn :=: g 4 qn :+: f 4 qn :=: gs 4 qn :+:
>         g 4 qn :=: a 4 qn :+: af 4 qn :=: b 4 qn :+:
>         a 4 qn :=: c 5 qn :+: b 4 qn :=: d 5 qn :+:
>         c 4 qn :=: e 5 qn

Inject the 8/4 time signature metadata wrapper into the rendering compilation thread.

> main = writeMidi "c6dim.midi" $ Modify (Custom "TimeSignature: 8/4") music
