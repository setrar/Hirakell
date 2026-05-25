Load MIDI File

As a simple example, suppose one wishes to generate a ii-V-I chord progression.

> import Euterpea

We wrap the file reading and playback inside a main function execution block.

> main :: IO ()
> main = do
>   -- 1. Read the raw MIDI data structure from your file
>   result <- importFile "guaguanco/guaguanco-rhumba.mid"
>
>   -- 2. Unpack it, convert it to a Music structure, and play it on device 7!
>   case result of
>     Left err      -> putStrLn ("Error: " ++ err)
>     Right rawMidi -> playDev 7 (fromMidi rawMidi)
