# [An Infinite Jazz Music Generator](http://35.94.226.157/an-infinite-jazz-music-generator)

```bash
ghci -package Euterpea -package mtl -package random -package vector -package bytestring
```

---

In **Euterpea**, General MIDI instruments are represented by the `InstrumentName` data type. Here is the complete list of all constructors available in Euterpea, grouped by family:

> ghci> :info InstrumentName

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

---

## 🎵 **Semitones**

A **semitone** (also called a **half step**) is the smallest standard musical interval used in Western music. It represents the distance in pitch from one note to the very next adjacent note on a keyboard or fretboard.

---

### Visualizing a Semitone

* **On a Piano:** Moving from any key to the **immediately adjacent key** (black or white) is a semitone.
* $C \rightarrow C\sharp$ (White key to the adjacent black key) = **1 semitone**
* $E \rightarrow F$ (White key to white key, because there is no black key between them) = **1 semitone**


* **On a Guitar:** Moving up or down by **1 fret** is a semitone.

---

### Semitones vs. Whole Steps

* **1 Semitone (Half Step):** 1 step adjacent ($C \rightarrow C\sharp$).
* **1 Tone / Whole Step:** 2 semitones combined ($C \rightarrow D$).

---

### Semitones in Pitch Class Arithmetic

In digital music, MIDI, and Haskell music libraries like Euterpea, semitones are used as the basic unit of measurement for pitch classes ($0$ to $11$), where every integer increase represents **1 semitone higher**:

| Note | Pitch Class / Semitone Value |
| --- | --- |
| **C** | 0 |
| **C♯ / D♭** | 1 |
| **D** | 2 |
| **D♯ / E♭** | 3 |
| **E** | 4 |
| **F** | 5 |
| **F♯ / G♭** | 6 |
| **G** | 7 |
| **G♯ / A♭** | 8 |
| **A** | 9 |
| **A♯ / B♭** | 10 |
| **B** | 11 |

Because 12 semitones make up an entire **octave**, adding 12 semitones to any note doubles its fundamental frequency and lands on the exact same note name one octave higher ($C4 = 60 \rightarrow C5 = 72$).
