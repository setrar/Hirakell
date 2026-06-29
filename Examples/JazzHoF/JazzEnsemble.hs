module JazzEnsemble where

import Euterpea
import qualified Codec.Midi as HMidi

-- =====================================================================
-- 1. THE HIGHER-ORDER TYPE (The Ensemble Blueprint)
-- =====================================================================
-- A type that takes another type 'a' as an argument.
data Ensemble a = Trio a a a | Quartet a a a a
  deriving (Show, Eq)

-- Make our Higher-Order Type a Functor so we can map transformations over it
instance Functor Ensemble where
  fmap function (Trio x y z)      = Trio (function x) (function y) (function z)
  fmap function (Quartet w x y z) = Quartet (function w) (function x) (function y) (function z)


-- =====================================================================
-- 2. TRANSFORMATION ENGINE & PLAYBACK UTILITIES
-- =====================================================================
-- Unpacks the higher-order structure and collapses it into Euterpea's parallel tree
collapseEnsemble :: Ensemble (Music Pitch) -> Music Pitch
collapseEnsemble (Trio track1 track2 track3)     = track1 :=: track2 :=: track3
collapseEnsemble (Quartet t1 t2 t3 t4)           = t1 :=: t2 :=: t3 :=: t4

-- Play live out of speakers via GHCI
playEnsemble :: Ensemble (Music Pitch) -> IO ()
playEnsemble ensemble = play (collapseEnsemble ensemble)


-- =====================================================================
-- 3. THE LIVE JAZZ GIG (Data Definition)
-- =====================================================================
-- Let's build a raw C-Major triad vamp inside our abstract Trio wrapper
myOriginalVamp :: Ensemble (Music Pitch)
myOriginalVamp = Trio (c 4 qn) (e 4 qn) (g 4 qn)

-- Let's apply a "Swing Shift" modulation over the whole ensemble using fmap
-- This transposes every element inside the Higher-Order Type up 3 semitones (Minor 3rd)
modulatedVamp :: Ensemble (Music Pitch)
modulatedVamp = fmap (transpose 3) myOriginalVamp

-- =====================================================================
-- 4. BONUS: BULLETPROOF STUDIO MIDI EXPORTER
-- =====================================================================
-- Compiles your collapsed type safely into a Multi-Track Type-1 MIDI file
exportEnsembleMidi :: FilePath -> Int -> Int -> Ensemble (Music Pitch) -> IO ()
exportEnsembleMidi filename num denom ensemble = do
  let music = collapseEnsemble ensemble
  let denomPower = round (logBase 2 (fromIntegral denom) :: Double)
  let instrumentPerformances = splitByInst (perform music)
  let musicTracks = concatMap (HMidi.tracks . toMidi . snd) instrumentPerformances
  let timeSigTrack = [(0, HMidi.TimeSignature num denomPower 24 8), (0, HMidi.TrackEnd)]
  let rawMidiStruct = toMidi (perform music)
  let fixedMidiFile = rawMidiStruct { HMidi.tracks = timeSigTrack : musicTracks }
  
  HMidi.exportFile filename fixedMidiFile
  putStrLn $ "🚀 Dumped ensemble to " ++ filename ++ " (" ++ show num ++ "/" ++ show denom ++ " Grid)"
