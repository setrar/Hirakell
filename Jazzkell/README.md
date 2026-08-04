# [An Infinite Jazz Music Generator](http://35.94.226.157/an-infinite-jazz-music-generator)

```bash
ghci -package Euterpea -package mtl -package random -package vector -package bytestring
```

---

In **Euterpea**, General MIDI instruments are represented by the `InstrumentName` data type. Here is the complete list of all constructors available in Euterpea, grouped by family:

### 1. Piano

* `AcousticGrandPiano`
* `BrightAcousticPiano`
* `ElectricGrandPiano`
* `HonkyTonkPiano`
* `ElectricPiano1` *(or `RhodesPiano`)*
* `ElectricPiano2`
* `Harpsichord`
* `Clavinet`

### 2. Chromatic Percussion

* `Celesta`
* `Glockenspiel`
* `MusicBox`
* `Vibraphone`
* `Marimba`
* `Xylophone`
* `TubularBells`
* `Dulcimer`

### 3. Organ

* `DrawbarOrgan`
* `PercussiveOrgan`
* `RockOrgan`
* `ChurchOrgan`
* `ReedOrgan`
* `Accordion`
* `Harmonica`
* `TangoAccordion`

### 4. Guitar

* `AcousticGuitarNylon`
* `AcousticGuitarSteel`
* `ElectricGuitarJazz`
* `ElectricGuitarClean`
* `ElectricGuitarMuted`
* `OverdrivenGuitar`
* `DistortionGuitar`
* `GuitarHarmonics`

### 5. Bass

* `AcousticBass`
* `ElectricBassFinger`
* `ElectricBassPick`
* `FretlessBass`
* `SlapBass1`
* `SlapBass2`
* `SynthBass1`
* `SynthBass2`

### 6. Strings

* `Violin`
* `Viola`
* `Cello`
* `Contrabass`
* `TremoloStrings`
* `PizzicatoStrings`
* `OrchestralHarp`
* `Timpani`

### 7. Ensemble

* `StringEnsemble1`
* `StringEnsemble2`
* `SynthStrings1`
* `SynthStrings2`
* `ChoirAahs`
* `VoiceOohs`
* `SynthVoice`
* `OrchestraHit`

### 8. Brass

* `Trumpet`
* `Trombone`
* `Tuba`
* `MutedTrumpet`
* `FrenchHorn`
* `BrassSection`
* `SynthBrass1`
* `SynthBrass2`

### 9. Reed

* `SopranoSax`
* `AltoSax`
* `TenorSax`
* `BaritoneSax`
* `Oboe`
* `EnglishHorn`
* `Bassoon`
* `Clarinet`

### 10. Pipe

* `Piccolo`
* `Flute`
* `Recorder`
* `PanFlute`
* `BlownBottle`
* `Shakuhachi`
* `Whistle`
* `Ocarina`

### 11. Synth Lead

* `Lead1Square`
* `Lead2Sawtooth`
* `Lead3Calliope`
* `Lead4Chiff`
* `Lead5Charang`
* `Lead6Voice`
* `Lead7Fifths`
* `Lead8BassAndLead`

### 12. Synth Pad

* `Pad1NewAge`
* `Pad2Warm`
* `Pad3Polysynth`
* `Pad4Choir`
* `Pad5Bowed`
* `Pad6Metallic`
* `Pad7Halo`
* `Pad8Sweep`

### 13. Synth Effects

* `FX1Rain`
* `FX2Soundtrack`
* `FX3Crystal`
* `FX4Atmosphere`
* `FX5Brightness`
* `FX6Goblins`
* `FX7Echoes`
* `FX8SciFi`

### 14. Ethnic

* `Sitar`
* `Banjo`
* `Shamisen`
* `Koto`
* `Kalimba`
* `Bagpipe`
* `Fiddle`
* `Shanai`

### 15. Percussive

* `TinkleBell`
* `Agogo`
* `SteelDrums`
* `Woodblock`
* `TaikoDrum`
* `MelodicTom`
* `SynthDrum`
* `ReverseCymbal`

### 16. Sound Effects

* `GuitarFretNoise`
* `BreathNoise`
* `Seashore`
* `BirdTweet`
* `TelephoneRing`
* `Helicopter`
* `Applause`
* `Gunshot`

---

### Special & Percussion Names in Euterpea

* `Custom String` – For user-defined custom instruments.
* **Percussion Instruments:** Euterpea also provides the `PercussionClass` data type for GM Channel 10 percussion sounds (e.g., `AcousticBassDrum`, `ClosedHiHat`, `AcousticSnare`, `RideCymbal1`).

### How to use them in code:

```haskell
-- Assigning instruments using the 'instrument' modifier:
bassPart  = instrument AcousticBass myBassLine
chordPart = instrument RhodesPiano myChords
soloPart  = instrument TenorSax myMelody

mySong = bassPart :=: chordPart :=: soloPart

```
