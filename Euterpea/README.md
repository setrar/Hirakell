# Euterpea


For that $E\flat^{\text{maj7}}$ chord from *Someday My Prince Will Come*, your $E\flat$ Lydian scale ($E\flat, F, G, A, B\flat, C, D$) represented as a `Scale` type would be:

```haskell
ghci> -- Eb Lydian (3, 5, 7, 9, 10, 0, 2)
ghci> ebLydian :: Scale
ghci> ebLydian = [3, 5, 7, 9, 10, 0, 2]

```

### Useful GHCi inspection trick

If you ever want to see what functions Euterpea provides to build or manipulate objects, you can ask GHCi to search for functions using the `Scale` type:

```ghci
ghci> :browse Euterpea
```
<details><summary>🎋 </summary>

```Haskell
(/=:) :: Music a -> Music a -> Music a
(<<<) ::
  forall {k} (cat :: k -> k -> *) (b :: k) (c :: k) (a :: k).
  ghc-internal-9.1204.0:GHC.Internal.Control.Category.Category cat =>
  cat b c -> cat a b -> cat a c
(<<^) :: Arrow a => a c d -> (b -> c) -> a b d
(>>>) ::
  forall {k} (cat :: k -> k -> *) (a :: k) (b :: k) (c :: k).
  ghc-internal-9.1204.0:GHC.Internal.Control.Category.Category cat =>
  cat a b -> cat b c -> cat a c
(>>^) :: Arrow a => a b c -> (c -> d) -> a b d
type AbsPitch :: *
type AbsPitch = Int
type Arrow :: (* -> * -> *) -> Constraint
class ghc-internal-9.1204.0:GHC.Internal.Control.Category.Category
        a =>
      Arrow a where
  arr :: (b -> c) -> a b c
  first :: a b c -> a (b, d) (c, d)
  second :: a b c -> a (d, b) (d, c)
  (***) :: a b c -> a b' c' -> a (b, b') (c, c')
  (&&&) :: a b c -> a b c' -> a b (c, c')
  {-# MINIMAL arr, (first | (***)) #-}
type ArrowApply :: (* -> * -> *) -> Constraint
class Arrow a => ArrowApply a where
  app :: a (a b c, b) c
  {-# MINIMAL app #-}
type ArrowChoice :: (* -> * -> *) -> Constraint
class Arrow a => ArrowChoice a where
  left :: a b c -> a (Either b d) (Either c d)
  right :: a b c -> a (Either d b) (Either d c)
  (+++) :: a b c -> a b' c' -> a (Either b b') (Either c c')
  (|||) :: a b d -> a c d -> a (Either b c) d
  {-# MINIMAL (left | (+++)) #-}
type ArrowLoop :: (* -> * -> *) -> Constraint
class Arrow a => ArrowLoop a where
  loop :: a (b, d) (c, d) -> a b c
  {-# MINIMAL loop #-}
type role ArrowMonad representational nominal
type ArrowMonad :: (* -> * -> *) -> * -> *
newtype ArrowMonad a b = ArrowMonad (a () b)
type ArrowPlus :: (* -> * -> *) -> Constraint
class ArrowZero a => ArrowPlus a where
  (<+>) :: a b c -> a b c -> a b c
  {-# MINIMAL (<+>) #-}
type ArrowZero :: (* -> * -> *) -> Constraint
class Arrow a => ArrowZero a where
  zeroArrow :: a b c
  {-# MINIMAL zeroArrow #-}
type Articulation :: *
data Articulation
  = Staccato Rational
  | Legato Rational
  | Slurred Rational
  | Tenuto
  | Marcato
  | Pedal
  | Fermata
  | FermataDown
  | Breath
  | DownBow
  | UpBow
  | Harmonic
  | Pizzicato
  | LeftPizz
  | BartokPizz
  | Swell
  | Wedge
  | Thumb
  | Stopped
type AudRate :: *
data AudRate
type AudSF :: * -> * -> *
type AudSF a b = SigFun AudRate a b
type AudioSample :: * -> Constraint
class AudioSample a where
  zero :: a
  mix :: a -> a -> a
  collapse :: a -> [Double]
  numChans :: a -> Int
  {-# MINIMAL zero, mix, collapse, numChans #-}
type ChannelMap :: *
type ChannelMap =
  [(InstrumentName, HCodecs-0.5.2:Codec.Midi.Channel)]
type ChannelMapFun :: *
type ChannelMapFun =
  InstrumentName
  -> ChannelMap -> (HCodecs-0.5.2:Codec.Midi.Channel, ChannelMap)
type Clock :: * -> Constraint
class Clock p where
  rate :: p -> Double
  {-# MINIMAL rate #-}
type Control :: *
data Control
  = Tempo Rational
  | Transpose AbsPitch
  | Instrument InstrumentName
  | Phrase [PhraseAttribute]
  | KeySig PitchClass Mode
  | Custom String
type CtrRate :: *
data CtrRate
type CtrSF :: * -> * -> *
type CtrSF a b = SigFun CtrRate a b
type DeviceInfo :: *
data DeviceInfo
  = DeviceInfo {interface :: String,
                name :: String,
                input :: Bool,
                output :: Bool,
                opened :: Bool}
type Dur :: *
type Dur = Rational
type DurT :: *
type DurT = Rational
type Dynamic :: *
data Dynamic
  = Accent Rational
  | Crescendo Rational
  | Diminuendo Rational
  | StdLoudness StdLoudness
  | Loudness Rational
type InputDeviceID :: *
newtype InputDeviceID
  = Euterpea.IO.MIDI.MidiIO.InputDeviceID PortMidi-0.2.0.0:Sound.PortMidi.DeviceID
type Instr :: * -> *
type Instr a = Dur -> AbsPitch -> Volume -> [Double] -> a
type InstrMap :: * -> *
type InstrMap a = [(InstrumentName, Instr a)]
type InstrumentName :: *
data InstrumentName
  = AcousticGrandPiano
  | BrightAcousticPiano
  | ElectricGrandPiano
  | HonkyTonkPiano
  | RhodesPiano
  | ChorusedPiano
  | Harpsichord
  | Clavinet
  | Celesta
  | Glockenspiel
  | MusicBox
  | Vibraphone
  | Marimba
  | Xylophone
  | TubularBells
  | Dulcimer
  | HammondOrgan
  | PercussiveOrgan
  | RockOrgan
  | ChurchOrgan
  | ReedOrgan
  | Accordion
  | Harmonica
  | TangoAccordion
  | AcousticGuitarNylon
  | AcousticGuitarSteel
  | ElectricGuitarJazz
  | ElectricGuitarClean
  | ElectricGuitarMuted
  | OverdrivenGuitar
  | DistortionGuitar
  | GuitarHarmonics
  | AcousticBass
  | ElectricBassFingered
  | ElectricBassPicked
  | FretlessBass
  | SlapBass1
  | SlapBass2
  | SynthBass1
  | SynthBass2
  | Violin
  | Viola
  | Cello
  | Contrabass
  | TremoloStrings
  | PizzicatoStrings
  | OrchestralHarp
  | Timpani
  | StringEnsemble1
  | StringEnsemble2
  | SynthStrings1
  | SynthStrings2
  | ChoirAahs
  | VoiceOohs
  | SynthVoice
  | OrchestraHit
  | Trumpet
  | Trombone
  | Tuba
  | MutedTrumpet
  | FrenchHorn
  | BrassSection
  | SynthBrass1
  | SynthBrass2
  | SopranoSax
  | AltoSax
  | TenorSax
  | BaritoneSax
  | Oboe
  | Bassoon
  | EnglishHorn
  | Clarinet
  | Piccolo
  | Flute
  | Recorder
  | PanFlute
  | BlownBottle
  | Shakuhachi
  | Whistle
  | Ocarina
  | Lead1Square
  | Lead2Sawtooth
  | Lead3Calliope
  | Lead4Chiff
  | Lead5Charang
  | Lead6Voice
  | Lead7Fifths
  | Lead8BassLead
  | Pad1NewAge
  | Pad2Warm
  | Pad3Polysynth
  | Pad4Choir
  | Pad5Bowed
  | Pad6Metallic
  | Pad7Halo
  | Pad8Sweep
  | FX1Train
  | FX2Soundtrack
  | FX3Crystal
  | FX4Atmosphere
  | FX5Brightness
  | FX6Goblins
  | FX7Echoes
  | FX8SciFi
  | Sitar
  | Banjo
  | Shamisen
  | Koto
  | Kalimba
  | Bagpipe
  | Fiddle
  | Shanai
  | TinkleBell
  | Agogo
  | SteelDrums
  | Woodblock
  | TaikoDrum
  | MelodicDrum
  | SynthDrum
  | ReverseCymbal
  | GuitarFretNoise
  | BreathNoise
  | Seashore
  | BirdTweet
  | TelephoneRing
  | Helicopter
  | Applause
  | Gunshot
  | Percussion
  | CustomInstrument String
type role Kleisli representational representational nominal
type Kleisli :: (* -> *) -> * -> * -> *
newtype Kleisli m a b = Kleisli {runKleisli :: a -> m b}
type LazyDur :: *
type LazyDur = [Dur]
type MContext :: *
data MContext
  = MContext {mcTime :: PTime,
              mcInst :: InstrumentName,
              mcDur :: DurT,
              mcVol :: Volume}
type MEvent :: *
data MEvent
  = MEvent {eTime :: PTime,
            eInst :: InstrumentName,
            ePitch :: AbsPitch,
            eDur :: DurT,
            eVol :: Volume,
            eParams :: [Double]}
type Message :: *
data Message
  = NoteOff {channel :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Channel,
             key :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Key,
             velocity :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Velocity}
  | NoteOn {channel :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Channel,
            key :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Key,
            velocity :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Velocity}
  | KeyPressure {channel :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Channel,
                 key :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Key,
                 pressure :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Pressure}
  | ControlChange {channel :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Channel,
                   controllerNumber :: {-# UNPACK #-}Int,
                   controllerValue :: {-# UNPACK #-}Int}
  | ProgramChange {channel :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Channel,
                   preset :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Preset}
  | ChannelPressure {channel :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Channel,
                     pressure :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Pressure}
  | PitchWheel {channel :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Channel,
                pitchWheel :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.PitchWheel}
  | SequenceNumber {-# UNPACK #-}Int
  | Text !String
  | Copyright !String
  | TrackName !String
  | InstrumentName !String
  | Lyrics !String
  | Marker !String
  | CuePoint !String
  | ChannelPrefix {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Channel
  | ProgramName !String
  | DeviceName !String
  | TrackEnd
  | TempoChange {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Tempo
  | SMPTEOffset {-# UNPACK #-}Int
                {-# UNPACK #-}Int
                {-# UNPACK #-}Int
                {-# UNPACK #-}Int
                {-# UNPACK #-}Int
  | TimeSignature {-# UNPACK #-}Int
                  {-# UNPACK #-}Int
                  {-# UNPACK #-}Int
                  {-# UNPACK #-}Int
  | KeySignature {-# UNPACK #-}Int {-# UNPACK #-}Int
  | Reserved {-# UNPACK #-}Int
             !bytestring-0.12.2.0:Data.ByteString.Lazy.Internal.ByteString
  | Sysex {-# UNPACK #-}Int
          !bytestring-0.12.2.0:Data.ByteString.Lazy.Internal.ByteString
type MidiEvent :: *
type MidiEvent = (HCodecs-0.5.2:Codec.Midi.Ticks, Message)
type MidiMessage :: *
data MidiMessage
  = ANote {Euterpea.IO.MIDI.MidiIO.channel :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Channel,
           Euterpea.IO.MIDI.MidiIO.key :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Key,
           Euterpea.IO.MIDI.MidiIO.velocity :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Velocity,
           Euterpea.IO.MIDI.MidiIO.duration :: {-# UNPACK #-}HCodecs-0.5.2:Codec.Midi.Time}
  | Std Message
type Mode :: *
data Mode
  = Major
  | Minor
  | Ionian
  | Dorian
  | Phrygian
  | Lydian
  | Mixolydian
  | Aeolian
  | Locrian
  | CustomMode String
type Mono :: * -> *
type Mono p = Signal p () Double
type Music :: * -> *
data Music a
  = Prim (Primitive a)
  | (Music a) :+: (Music a)
  | (Music a) :=: (Music a)
  | Modify Control (Music a)
type Music1 :: *
type Music1 = Music Note1
type Note1 :: *
type Note1 = (Pitch, [NoteAttribute])
type NoteAttribute :: *
data NoteAttribute
  = Volume Int
  | Fingering Integer
  | Dynamics String
  | Params [Double]
type NoteHead :: *
data NoteHead
  = DiamondHead
  | SquareHead
  | XHead
  | TriangleHead
  | TremoloHead
  | SlashHead
  | ArtHarmonic
  | NoHead
type Octave :: *
type Octave = Int
type Ornament :: *
data Ornament
  = Trill
  | Mordent
  | InvMordent
  | DoubleMordent
  | Turn
  | TrilledTurn
  | ShortTrill
  | Arpeggio
  | ArpeggioUp
  | ArpeggioDown
  | Instruction String
  | Head NoteHead
  | DiatonicTrans Int
type OutputDeviceID :: *
newtype OutputDeviceID
  = Euterpea.IO.MIDI.MidiIO.OutputDeviceID PortMidi-0.2.0.0:Sound.PortMidi.DeviceID
type PTime :: *
type PTime = Rational
type PercussionSound :: *
data PercussionSound
  = AcousticBassDrum
  | BassDrum1
  | SideStick
  | AcousticSnare
  | HandClap
  | ElectricSnare
  | LowFloorTom
  | ClosedHiHat
  | HighFloorTom
  | PedalHiHat
  | LowTom
  | OpenHiHat
  | LowMidTom
  | HiMidTom
  | CrashCymbal1
  | HighTom
  | RideCymbal1
  | ChineseCymbal
  | RideBell
  | Tambourine
  | SplashCymbal
  | Cowbell
  | CrashCymbal2
  | Vibraslap
  | RideCymbal2
  | HiBongo
  | LowBongo
  | MuteHiConga
  | OpenHiConga
  | LowConga
  | HighTimbale
  | LowTimbale
  | HighAgogo
  | LowAgogo
  | Cabasa
  | Maracas
  | ShortWhistle
  | LongWhistle
  | ShortGuiro
  | LongGuiro
  | Claves
  | HiWoodBlock
  | LowWoodBlock
  | MuteCuica
  | OpenCuica
  | MuteTriangle
  | OpenTriangle
type Performance :: *
type Performance = [MEvent]
type PhraseAttribute :: *
data PhraseAttribute
  = Dyn Dynamic | Tmp Tempo | Art Articulation | Orn Ornament
type Pitch :: *
type Pitch = (PitchClass, Octave)
type PitchClass :: *
data PitchClass
  = Cff
  | Cf
  | C
  | Dff
  | Cs
  | Df
  | Css
  | D
  | Eff
  | Ds
  | Ef
  | Fff
  | Dss
  | E
  | Ff
  | Es
  | F
  | Gff
  | Ess
  | Fs
  | Gf
  | Fss
  | G
  | Aff
  | Gs
  | Af
  | Gss
  | A
  | Bff
  | As
  | Bf
  | Ass
  | B
  | Bs
  | Bss
type PlayParams :: *
data PlayParams
  = PlayParams {strict :: Bool,
                chanPolicy :: ChannelMapFun,
                devID :: Maybe OutputDeviceID,
                closeDelay :: HCodecs-0.5.2:Codec.Midi.Time,
                perfAlg :: Music1 -> [MEvent]}
type PluckDecayMethod :: *
data PluckDecayMethod
  = SimpleAveraging
  | StretchedAveraging Double
  | SimpleDrum Double
  | StretchedDrum Double Double
  | WeightedAveraging Double Double
  | RecursiveFilter
type Primitive :: * -> *
data Primitive a = Note Dur a | Rest Dur
type ProgNum :: *
type ProgNum = Int
type SigFun :: * -> * -> * -> *
type SigFun clk a b =
  Control.Arrow.ArrowP.ArrowP Control.SF.SF.SF clk a b
type Signal :: * -> * -> * -> *
type Signal clk a b =
  Control.Arrow.ArrowP.ArrowP Control.SF.SF.SF clk a b
type StdLoudness :: *
data StdLoudness = PPP | PP | P | MP | SF | MF | NF | FF | FFF
type Stereo :: * -> *
type Stereo p = Signal p () (Double, Double)
type Table :: *
data Table
  = Euterpea.IO.Audio.BasicSigFuns.Table {-# UNPACK #-}Int
                                         {-# UNPACK #-}(array-0.5.8.0:Data.Array.Base.UArray
                                                          Int Double)
                                         !Bool
type Tempo :: *
data Tempo = Ritardando Rational | Accelerando Rational
type ToMusic1 :: * -> Constraint
class ToMusic1 a where
  toMusic1 :: Music a -> Music1
  {-# MINIMAL toMusic1 #-}
type UserPatchMap :: *
type UserPatchMap =
  [(InstrumentName, HCodecs-0.5.2:Codec.Midi.Channel)]
type Volume :: *
type Volume = Int
(^<<) :: Arrow a => (c -> d) -> a b c -> a b d
(^>>) :: Arrow a => (b -> c) -> a c d -> a b d
a :: Octave -> Dur -> Music Pitch
absPitch :: Pitch -> AbsPitch
addVolume :: Volume -> Music Pitch -> Music (Pitch, Volume)
af :: Octave -> Dur -> Music Pitch
aff :: Octave -> Dur -> Music Pitch
allValid :: UserPatchMap -> [InstrumentName] -> Bool
apToHz :: Floating a => AbsPitch -> a
applyControls :: Music1 -> Music1
as :: Octave -> Dur -> Music Pitch
ass :: Octave -> Dur -> Music Pitch
b :: Octave -> Dur -> Music Pitch
balance :: Clock p => Int -> Signal p (Double, Double) Double
bf :: Octave -> Dur -> Music Pitch
bff :: Octave -> Dur -> Music Pitch
bn :: Dur
bnr :: Music Pitch
bs :: Octave -> Dur -> Music Pitch
bss :: Octave -> Dur -> Music Pitch
c :: Octave -> Dur -> Music Pitch
cf :: Octave -> Dur -> Music Pitch
cff :: Octave -> Dur -> Music Pitch
changeInstrument :: InstrumentName -> Music a -> Music a
chord :: [Music a] -> Music a
chord1 :: [Music a] -> Music a
countDown ::
  arrows-0.4.4.2:Control.Arrow.Operations.ArrowCircuit a =>
  Int -> a () Int
countTime ::
  Clock p =>
  Int
  -> Signal p () (Euterpea.IO.Audio.BasicSigFuns.SEvent ())
  -> Signal p () (Euterpea.IO.Audio.BasicSigFuns.SEvent ())
countUp ::
  arrows-0.4.4.2:Control.Arrow.Operations.ArrowCircuit a => a () Int
cs :: Octave -> Dur -> Music Pitch
css :: Octave -> Dur -> Music Pitch
cut :: Dur -> Music a -> Music a
cutL :: LazyDur -> Music a -> Music a
d :: Octave -> Dur -> Music Pitch
dden :: Dur
ddenr :: Music Pitch
ddhn :: Dur
ddhnr :: Music Pitch
ddqn :: Dur
ddqnr :: Music Pitch
defParams :: PlayParams
defST :: HCodecs-0.5.2:Codec.Midi.Tempo
defUpm :: UserPatchMap
defaultInput :: (InputDeviceID -> a -> IO b) -> a -> IO b
defaultOutput :: (OutputDeviceID -> a -> IO b) -> a -> IO b
delayLine :: Clock p => Double -> Signal p Double Double
delayLine1 :: Clock p => Double -> Signal p (Double, Double) Double
delayLineT :: Clock p => Int -> Table -> Signal p Double Double
den :: Dur
denr :: Music Pitch
devices :: IO ()
df :: Octave -> Dur -> Music Pitch
dff :: Octave -> Dur -> Music Pitch
dhn :: Dur
dhnr :: Music Pitch
division :: Int
dqn :: Dur
dqnr :: Music Pitch
ds :: Octave -> Dur -> Music Pitch
dsn :: Dur
dsnr :: Music Pitch
dss :: Octave -> Dur -> Music Pitch
dtn :: Dur
dtnr :: Music Pitch
dur :: Music a -> Dur
durL :: Music a -> LazyDur
dwn :: Dur
dwnr :: Music Pitch
dynamicCP ::
  Euterpea.IO.MIDI.Play.NumChannels
  -> Euterpea.IO.MIDI.Play.PercChan -> ChannelMapFun
e :: Octave -> Dur -> Music Pitch
ef :: Octave -> Dur -> Music Pitch
eff :: Octave -> Dur -> Music Pitch
en :: Dur
enr :: Music Pitch
envASR ::
  Clock p => Double -> Double -> Double -> Signal p () Double
envCSEnvlpx ::
  Clock p =>
  Double
  -> Double
  -> Double
  -> Table
  -> Double
  -> Double
  -> Signal p () Double
envExpon ::
  Clock p => Double -> Double -> Double -> Signal p () Double
envExponSeg ::
  Clock p => [Double] -> [Double] -> Signal p () Double
envLine ::
  Clock p => Double -> Double -> Double -> Signal p () Double
envLineSeg :: Clock p => [Double] -> [Double] -> Signal p () Double
es :: Octave -> Dur -> Music Pitch
ess :: Octave -> Dur -> Music Pitch
exportFile :: FilePath -> HCodecs-0.5.2:Codec.Midi.Midi -> IO ()
exportMidiFile ::
  FilePath -> HCodecs-0.5.2:Codec.Midi.Midi -> IO ()
f :: Octave -> Dur -> Music Pitch
ff :: Octave -> Dur -> Music Pitch
fff :: Octave -> Dur -> Music Pitch
filterBandPass ::
  Clock p => Int -> Signal p (Double, Double, Double) Double
filterBandPassBW ::
  Clock p => Signal p (Double, Double, Double) Double
filterBandStop ::
  Clock p => Int -> Signal p (Double, Double, Double) Double
filterBandStopBW ::
  Clock p => Signal p (Double, Double, Double) Double
filterComb :: Clock p => Double -> Signal p (Double, Double) Double
filterHighPass :: Clock p => Signal p (Double, Double) Double
filterHighPassBW :: Clock p => Signal p (Double, Double) Double
filterLowPass :: Clock p => Signal p (Double, Double) Double
filterLowPassBW :: Clock p => Signal p (Double, Double) Double
forever :: Music a -> Music a
fromGM :: Int -> InstrumentName
fromMidi :: HCodecs-0.5.2:Codec.Midi.Midi -> Music1
fs :: Octave -> Dur -> Music Pitch
fss :: Octave -> Dur -> Music Pitch
g :: Octave -> Dur -> Music Pitch
gf :: Octave -> Dur -> Music Pitch
gff :: Octave -> Dur -> Music Pitch
gs :: Octave -> Dur -> Music Pitch
gss :: Octave -> Dur -> Music Pitch
hn :: Dur
hnr :: Music Pitch
importFile ::
  FilePath -> IO (Either String HCodecs-0.5.2:Codec.Midi.Midi)
insertMEvent :: MidiEvent -> [MidiEvent] -> [MidiEvent]
instrument :: InstrumentName -> Music a -> Music a
integral ::
  (arrows-0.4.4.2:Control.Arrow.Operations.ArrowCircuit a,
   Clock p) =>
  Control.Arrow.ArrowP.ArrowP a p Double Double
invert :: Music Pitch -> Music Pitch
invert1 :: Music (Pitch, a) -> Music (Pitch, a)
invertAt :: Pitch -> Music Pitch -> Music Pitch
invertAt1 :: Pitch -> Music (Pitch, a) -> Music (Pitch, a)
invertRetro :: Music Pitch -> Music Pitch
keysig :: PitchClass -> Mode -> Music a -> Music a
leftApp :: ArrowApply a => a b c -> a (Either b d) (Either c d)
line :: [Music a] -> Music a
line1 :: [Music a] -> Music a
lineToList :: Music a -> [Music a]
linearCP ::
  Euterpea.IO.MIDI.Play.NumChannels
  -> Euterpea.IO.MIDI.Play.PercChan -> ChannelMapFun
lookupB :: UserPatchMap -> InstrumentName -> Bool
mFold ::
  (Primitive a -> b)
  -> (b -> b -> b)
  -> (b -> b -> b)
  -> (Control -> b -> b)
  -> Music a
  -> b
mMap :: (a -> b) -> Music a -> Music b
makeGMMap :: [InstrumentName] -> UserPatchMap
maxSample ::
  (AudioSample a, Clock p) =>
  Double -> Euterpea.IO.Audio.IO.Signal p () a -> Double
merge :: Performance -> Performance -> Performance
mergeLD :: LazyDur -> LazyDur -> LazyDur
mevsToMessages ::
  UserPatchMap -> (InstrumentName, [MEvent]) -> [MidiEvent]
milliseconds ::
  Clock p => Signal p () (Euterpea.IO.Audio.BasicSigFuns.SEvent ())
minL :: LazyDur -> Dur -> Dur
mkMEvents ::
  HCodecs-0.5.2:Codec.Midi.Channel
  -> MEvent -> (MidiEvent, MidiEvent)
musicToMEvents :: MContext -> Music1 -> (Performance, DurT)
musicToMsgs' ::
  ToMusic1 a =>
  PlayParams
  -> Music a -> [(HCodecs-0.5.2:Codec.Midi.Time, MidiMessage)]
noiseBLH :: Clock p => Int -> Signal p Double Double
noiseBLI :: Clock p => Int -> Signal p Double Double
noiseWhite :: Int -> Signal p () Double
note :: Dur -> a -> Music a
noteToMEvent ::
  MContext -> Dur -> (Pitch, [NoteAttribute]) -> MEvent
offset :: Dur -> Music a -> Music a
osc ::
  (Clock p,
   arrows-0.4.4.2:Control.Arrow.Operations.ArrowCircuit a) =>
  Table -> Double -> Control.Arrow.ArrowP.ArrowP a p Double Double
oscDur ::
  (Clock p, ArrowChoice a,
   arrows-0.4.4.2:Control.Arrow.Operations.ArrowCircuit a) =>
  Table
  -> Double -> Double -> Control.Arrow.ArrowP.ArrowP a p () Double
oscDurI ::
  (Clock p, ArrowChoice a,
   arrows-0.4.4.2:Control.Arrow.Operations.ArrowCircuit a) =>
  Table
  -> Double -> Double -> Control.Arrow.ArrowP.ArrowP a p () Double
oscFixed ::
  (Clock p,
   arrows-0.4.4.2:Control.Arrow.Operations.ArrowCircuit a) =>
  Double -> Control.Arrow.ArrowP.ArrowP a p () Double
oscI ::
  (Clock p,
   arrows-0.4.4.2:Control.Arrow.Operations.ArrowCircuit a) =>
  Table -> Double -> Control.Arrow.ArrowP.ArrowP a p Double Double
oscPartials ::
  Clock p => Table -> Double -> Signal p (Double, Int) Double
outA :: Arrow a => a b b
outFile ::
  (AudioSample a, Clock p) =>
  String -> Double -> Euterpea.IO.Audio.IO.Signal p () a -> IO ()
outFileNorm ::
  (AudioSample a, Clock p) =>
  String -> Double -> Euterpea.IO.Audio.IO.Signal p () a -> IO ()
pMap :: (a -> b) -> Primitive a -> Primitive b
pcToInt :: PitchClass -> Int
pchToHz :: Floating a => Pitch -> a
perc :: PercussionSound -> Dur -> Music Pitch
perform :: ToMusic1 a => Music a -> Performance
perform1 :: Music1 -> Performance
perform1Dur :: Music1 -> (Performance, DurT)
phrase :: [PhraseAttribute] -> Music a -> Music a
phraseToMEvents ::
  MContext -> [PhraseAttribute] -> Music1 -> (Performance, DurT)
pitch :: AbsPitch -> Pitch
play ::
  (ToMusic1 a, deepseq-1.5.1.0:Control.DeepSeq.NFData a) =>
  Music a -> IO ()
playC ::
  (ToMusic1 a, deepseq-1.5.1.0:Control.DeepSeq.NFData a) =>
  PlayParams -> Music a -> IO ()
playDev ::
  (ToMusic1 a, deepseq-1.5.1.0:Control.DeepSeq.NFData a) =>
  Int -> Music a -> IO ()
playDevS ::
  (ToMusic1 a, deepseq-1.5.1.0:Control.DeepSeq.NFData a) =>
  Int -> Music a -> IO ()
playM' ::
  Maybe OutputDeviceID -> HCodecs-0.5.2:Codec.Midi.Midi -> IO ()
playMidi ::
  OutputDeviceID -> HCodecs-0.5.2:Codec.Midi.Midi -> IO ()
playS ::
  (ToMusic1 a, deepseq-1.5.1.0:Control.DeepSeq.NFData a) =>
  Music a -> IO ()
pluck ::
  Clock p =>
  Table -> Double -> PluckDecayMethod -> Signal p Double Double
predefinedCP :: ChannelMap -> ChannelMapFun
qn :: Dur
qnr :: Music Pitch
remove :: Dur -> Music a -> Music a
removeInstruments :: Music a -> Music a
removeZeros :: Music a -> Music a
renderSF ::
  (Clock p, ToMusic1 a, AudioSample b) =>
  Music a -> InstrMap (Signal p () b) -> (Double, Signal p () b)
rest :: Dur -> Music a
retro :: Music a -> Music a
retroInvert :: Music Pitch -> Music Pitch
returnA :: Arrow a => a b b
samples ::
  Clock p => Signal p () (Euterpea.IO.Audio.BasicSigFuns.SEvent ())
scaleDurations :: Rational -> Music a -> Music a
seconds ::
  Clock p => Signal p () (Euterpea.IO.Audio.BasicSigFuns.SEvent ())
sfn :: Dur
sfnr :: Music Pitch
shiftPitches :: AbsPitch -> Music Pitch -> Music Pitch
shiftPitches1 :: AbsPitch -> Music (Pitch, b) -> Music (Pitch, b)
sn :: Dur
snr :: Music Pitch
splitByInst :: [MEvent] -> [(InstrumentName, [MEvent])]
tableBessel :: Int -> Double -> Table
tableBesselN ::
  Euterpea.IO.Audio.BasicSigFuns.TableSize -> Double -> Table
tableExpon ::
  Int
  -> Euterpea.IO.Audio.BasicSigFuns.StartPt
  -> [(Euterpea.IO.Audio.BasicSigFuns.SegLength,
       Euterpea.IO.Audio.BasicSigFuns.EndPt)]
  -> Table
tableExponN ::
  Euterpea.IO.Audio.BasicSigFuns.TableSize
  -> Euterpea.IO.Audio.BasicSigFuns.StartPt
  -> [(Euterpea.IO.Audio.BasicSigFuns.SegLength,
       Euterpea.IO.Audio.BasicSigFuns.EndPt)]
  -> Table
tableLinear ::
  Int
  -> Euterpea.IO.Audio.BasicSigFuns.StartPt
  -> [(Euterpea.IO.Audio.BasicSigFuns.SegLength,
       Euterpea.IO.Audio.BasicSigFuns.EndPt)]
  -> Table
tableLinearN ::
  Euterpea.IO.Audio.BasicSigFuns.TableSize
  -> Euterpea.IO.Audio.BasicSigFuns.StartPt
  -> [(Euterpea.IO.Audio.BasicSigFuns.SegLength,
       Euterpea.IO.Audio.BasicSigFuns.EndPt)]
  -> Table
tableSines :: Int -> [Double] -> Table
tableSines3 ::
  Int
  -> [(Euterpea.IO.Audio.BasicSigFuns.PartialNum,
       Euterpea.IO.Audio.BasicSigFuns.PartialStrength,
       Euterpea.IO.Audio.BasicSigFuns.PhaseOffset)]
  -> Table
tableSines3N ::
  Euterpea.IO.Audio.BasicSigFuns.TableSize
  -> [(Euterpea.IO.Audio.BasicSigFuns.PartialNum,
       Euterpea.IO.Audio.BasicSigFuns.PartialStrength,
       Euterpea.IO.Audio.BasicSigFuns.PhaseOffset)]
  -> Table
tableSinesN ::
  Euterpea.IO.Audio.BasicSigFuns.TableSize
  -> [Euterpea.IO.Audio.BasicSigFuns.PartialStrength] -> Table
tempo :: Dur -> Music a -> Music a
times :: Int -> Music a -> Music a
tn :: Dur
tnr :: Music Pitch
toDelta :: (RealFrac a, Integral b) => a -> b
toGM :: InstrumentName -> Int
toMidi :: [MEvent] -> HCodecs-0.5.2:Codec.Midi.Midi
toMidiUPM ::
  UserPatchMap -> [MEvent] -> HCodecs-0.5.2:Codec.Midi.Midi
trans :: Int -> Pitch -> Pitch
transpose :: AbsPitch -> Music a -> Music a
upmLookup ::
  UserPatchMap
  -> InstrumentName -> (HCodecs-0.5.2:Codec.Midi.Channel, ProgNum)
upsample ::
  (ArrowChoice a,
   arrows-0.4.4.2:Control.Arrow.Operations.ArrowCircuit a, Clock p1,
   Clock p2, AudioSample c) =>
  Control.Arrow.ArrowP.ArrowP a p1 b c
  -> Control.Arrow.ArrowP.ArrowP a p2 b c
wn :: Dur
wnr :: Music Pitch
writeMidi :: ToMusic1 a => FilePath -> Music a -> IO ()
writeWav ::
  (Clock p, ToMusic1 a1, AudioSample a2) =>
  String -> InstrMap (Signal p () a2) -> Music a1 -> IO ()
writeWavNorm ::
  (Clock p, ToMusic1 a1, AudioSample a2) =>
  String -> InstrMap (Signal p () a2) -> Music a1 -> IO ()

```

</details>

## Haskell Lang (type and data)

The distinction between `type` and `data` is one of the most fundamental concepts in Haskell. At a high level:

* **`type`** creates an **alias** (a new nickname for an existing type). It doesn't create anything new under the hood.
* **`data`** creates a **brand-new type** with its own constructors. It introduces a completely new shape of data that didn't exist before.

---

### 1. `type` (Type Synonyms)

Think of `type` as a **label or shortcut**. It tells the compiler: *"Whenever you see X, treat it exactly like Y."*

```haskell
-- Scale is just a list of integers. They are 100% interchangeable.
type Scale = [Int]
type PhoneNumber = String

```

#### Key Characteristics:

* **Zero Overhead:** It exists **only for human readability**. The compiler replaces `Scale` with `[Int]` during compilation.
* **No New Structure:** You cannot invent new data shapes or new constructors.
* **Interchangeable:** If a function expects a `[Int]`, you can pass a `Scale` and Haskell will not complain.

```haskell
myNotes :: [Int]
myNotes = [0, 2, 4, 5, 7, 9, 11]

-- This works because Scale AND [Int] are the exact same thing to GHC:
myScale :: Scale
myScale = myNotes 

```

---

### 2. `data` (Algebraic Data Types)

`data` creates a **completely new entity**. It defines a new type name *and* one or more **value constructors** (the actual tags/containers used to instantiate values).

```haskell
-- Defines a BRAND NEW type called 'Mode' with 3 possible values:
data Mode = Dorian | Mixolydian | Lydian

-- Defines a brand new 'Ensemble' container type:
data Ensemble a = Trio a a a | Quartet a a a a

```

#### Key Characteristics:

* **Strong Type Safety:** GHC prevents accidental mix-ups. An `Int` cannot be passed where a `Mode` is expected.
* **Pattern Matching:** You can pattern-match on the constructors (`Dorian`, `Trio`, etc.) in functions.
* **Custom Behavior:** You can define how the type behaves with typeclasses (`instance Functor`, `instance Show`, etc.).

---

### Comparison Matrix

| Feature | `type` (Synonym) | `data` (New Type) |
| --- | --- | --- |
| **What it does** | Renames an existing type | Creates a new type from scratch |
| **Runtime cost** | Zero (erased during compilation) | Slight memory footprint for constructors |
| **Constructors** | None (uses existing constructors) | Has its own constructors (`Trio`, `Just`, etc.) |
| **Type Safety** | Low (interchangeable with base type) | High (isolated by GHC) |
| **Pattern Matching** | Matches on underlying type | Matches on its own constructors |

---

### When to use which?

* **Use `type**` when you want to make complex type signatures easier to read without changing how the code runs (e.g., writing `type ChordProgression = [Pitch]` instead of `[(PitchClass, Octave)]`).
* **Use `data**` when you need a distinct domain model, state machine, custom data structure, or pattern-matchable variants (e.g., `data MusicalKey = Major PitchClass | Minor PitchClass`).

*(Note: Haskell also has a third keyword, `newtype`, which acts like `data` for single-constructor wrappers, but compiles away like `type` with zero performance overhead!)*

