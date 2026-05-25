import Euterpea
import qualified Codec.Midi as HMidi -- Alias HCodecs to avoid naming conflicts

-- ==========================================
-- 1. THE 5/4 JAZZ GROOVE (Piano / Bass)
-- ==========================================
takeFiveGroove :: Music Pitch
takeFiveGroove = line 
  [ chord [ef 3 dhn, gf 3 dhn, bf 3 dhn] :+: chord [bf 2 hn, df 3 hn, f 3 hn]
  , chord [ef 3 dhn, gf 3 dhn, bf 3 dhn] :+: chord [bf 2 hn, df 3 hn, f 3 hn]
  , chord [ef 3 dhn, gf 3 dhn, bf 3 dhn] :+: chord [bf 2 hn, df 3 hn, f 3 hn]
  , chord [ef 3 dhn, gf 3 dhn, bf 3 dhn] :+: chord [bf 2 hn, df 3 hn, f 3 hn]
  ]

pianoTrack :: Music Pitch
pianoTrack = instrument AcousticGrandPiano takeFiveGroove

-- ==========================================
-- 2. THE ICONIC SAXOPHONE MELODY
-- ==========================================
saxMelody :: Music Pitch
saxMelody = line
  [ rest dhn :+: rest hn
  , rest dhn :+: bf 4 qn :+: c 5 en :+: df 5 en
  , f 5 qn :+: ef 5 qn :+: df 5 qn :+: c 5 qn :+: bf 4 qn
  , af 4 qn :+: bf 4 dhn
  ]

saxTrack :: Music Pitch
saxTrack = instrument AltoSax saxMelody

takeFive :: Music Pitch
takeFive = tempo (170/120) (pianoTrack :=: saxTrack)

-- ==========================================
-- 3. THE COMPLETE BULLETPROOF MULTI-TRACK EXPORTER
-- ==========================================
exportFiveFourMidi :: FilePath -> Music Pitch -> IO ()
exportFiveFourMidi filename music = do
  -- 1. Split the algebraic music tree cleanly by instrument name first!
  -- This forces Euterpea to generate individual data streams for Piano and Sax
  let instrumentPerformances = splitByInst (perform music)
  
  -- 2. Map Euterpea's 'toMidi' converter over every separate instrument track
  -- Then extract and concatenate all resulting data tracks into a clean matrix
  let musicTracks = concatMap (HMidi.tracks . toMidi . snd) instrumentPerformances
  
  -- 3. Construct our dedicated global time signature header track (Track 0)
  let timeSigTrack = [(0, HMidi.TimeSignature 5 2 24 8), (0, HMidi.TrackEnd)]
  
  -- 4. Package everything together: Track 0 (Grid info), Track 1 (Piano), Track 2 (Sax)
  let rawMidiStruct = toMidi (perform music) -- Gather base structural metadata
  let fixedMidiFile = rawMidiStruct { HMidi.tracks = timeSigTrack : musicTracks }
  
  -- 5. Export clean binary file to disk
  HMidi.exportFile filename fixedMidiFile