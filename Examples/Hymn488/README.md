# 488. NA INONA NA INONA HITRANGA

<image src=images/488.png width=50% height=50% > </image>

This is a page from a Malagasy hymnal titled **"Ny Fiainana ao amin'ny Kristy"** (Life in Christ), featuring hymn number **488: *Na inona na inona hitranga*** ("Whatever Happens").

The music is written using the **Tonic Sol-fa** notation system (using syllables like *do, re, mi, fa, sol, la, ti* rather than standard staff notation), which is widely used in Madagascar.

Here is a full transcription of the Malagasy lyrics provided on this page:

---

## 488. NA INONA NA INONA HITRANGA

**Verse 1**
Na inona na inona hitranga, Jeso!
Na ny lanitra ho manga, Jeso!
Na ho maloka mangina, Jeso!
Dia ho feno ny fifaliana, Jeso!

**Fiverenana (Chorus)**
Ny fotoana dia handalo, Jeso!
Fa tsy hisy hampimalo, Jeso!
Raha miorina ao am-poko, Jeso!
Ilay fitiavanao inoako, Jeso!

---

**Verse 2**
Raha jereko ny andro lasa, Jeso!
Tao ny tsiky, tao ny ratra, Jeso!
Nefa Hianao, Ilay Mpampahery, Jeso!
No nambomba sy nijery, Jeso!
Ny fotoana, sns.

---

**Verse 3**
Ny ho avy antenaiko, Jeso!
Mbola ho fifalian' ny saiko, Jeso!
Ny hasasarako hisava, Jeso!
Ny harivako hazava, Jeso!
Ny fotoana, sns.

---

### Key Notes & Context

* **Composer/Author:** G. Andriamanantena (credited on both sides above the music).
* **Musical Key:** Do dia F 4/4 (Key of F Major, 4/4 time signature).
* **Meter:** 10.10.10.10. D
* **"sns."** at the end of verses 2 and 3 stands for *sy ny sisa*, which means "etc." indicating that the chorus (*Fiverenana*) should be repeated there.

---



Here is the complete transcription of the **Soprano (melody) line** for the hymn *Na inona na inona hitranga* from the file **4cc21b46-8354-4d83-8d60-0871b4e28252**, translated into **Euterpea** syntax.

Since the score is in **F Major** (`Do dia F`), the Tonic Sol-fa syllables map to the following pitches:

* $d = \text{F}$
* $r = \text{G}$
* $m = \text{A}$
* $f = \text{B}\flat$
* $s = \text{C}$
* $l = \text{D}$
* $t = \text{E}$
* *Modifications:* `di` is a raised $d$ ($\text{F}\sharp$), `s,` is a lower octave $\text{C}$, and `d'` is a higher octave $\text{F}$.

### Euterpea Code

```haskell
module Hymn488 where

import Euterpea

-- Tempo set to a standard 4/4 hymn pace (e.g., 90 BPM)
hymnMelody :: Music Pitch
hymnMelody = tempo (90/60) $ line [
    -- Verse 1: "Na inona na inona hitranga, Jeso! Nany laninitra ho manga, Jeso!"
    -- :m.,r | d : s,.d | m : m | r.,di | r | f.,m | r : l, | r : d | t, : t,.,l, | s,
    a 4 en, g 4 sn, | f 4 qn, c 4 en, f 4 en, | a 4 qn, a 4 qn, | g 4 en, fs 4 sn, | g 4 qn, 
    bf 4 en, a 4 sn, | g 4 qn, d 4 qn, | g 4 qn, f 4 qn, | e 4 qn, e 4 en, d 4 sn, | c 4 qn,

    -- "Na ho ma-lo-ka mangina, Je-so! Dia ho fe- no fi-fa- liana, Je-so!"
    -- :t,.,s, | d : t, .d | s : f | m.,m | r | f.,l | s : d | f.,m : r.,d | d : t,.,t, | d
    e 4 en, c 4 sn, | f 4 qn, e 4 en, f 4 en, | c 5 qn, bf 4 qn, | a 4 en, a 4 sn, | g 4 qn,
    bf 4 en, d 5 sn, | c 5 qn, f 4 qn, | bf 4 en, a 4 sn, g 4 en, f 4 sn, | f 4 qn, e 4 en, e 4 sn, | f 4 hn,

    -- Fiverenana (Chorus): "Ny fo-toa-na dia handa-lo, Jeso! Fatsyhi-sy hampi-ma-lo, Je-so!"
    -- :s.,l | l : m | f : s | f : f.,f | f | f.,s | s : r | m : f | f : m.,ri | m
    c 5 en, d 5 sn, | d 5 qn, a 4 qn, | bf 4 qn, c 5 qn, | bf 4 qn, bf 4 en, bf 4 sn, | bf 4 qn,
    bf 4 en, c 5 sn, | c 5 qn, g 4 qn, | a 4 qn, bf 4 qn, | bf 4 qn, a 4 en, gs 4 sn, | a 4 qn,

    -- "Raha mio-rina ao am-po-ko,Jeso! Lay fitia-va-nao i-noa-ko, Je-so!"
    -- :s,.,d | d : t, .d | s : f | m.,m | r | f.,l | s : d | f.,m : r.,d | d : t,.,t, | d 
    c 4 en, f 4 sn, | f 4 qn, e 4 en, f 4 en, | c 5 qn, bf 4 qn, | a 4 en, a 4 sn, | g 4 qn,
    bf 4 en, d 5 sn, | c 5 qn, f 4 qn, | bf 4 en, a 4 sn, g 4 en, f 4 sn, | f 4 qn, e 4 en, e 4 sn, | f 4 hn
    ]

-- Play function to test in GHCi
main :: IO ()
main = play hymnMelody

```

### Rhythmic Translation Guide Used:

* `qn` (Quarter note): Represented by a standalone slot separated by colons like `: d :`.
* `en` (Eighth note): Represented by separated dots or parts like `.d`.
* `en` + `sn` (Dotted eighth + Sixteenth note): Represented by the Sol-fa token `.,` (e.g., `m.,r` maps to `a 4 en, g 4 sn`).

---

Here is the full 4-part SATB harmony (**Soprano, Alto, Tenor, and Bass**) formatted cleanly for Euterpea.

To combine the voices so they play at the same time, we use Euterpea's parallel composition operator `(:=:)`.

```haskell
module Hymn488 where

import Euterpea

-- Tempo set to a standard 4/4 hymn pace (90 BPM)
hymnTempo :: Music Pitch -> Music Pitch
hymnTempo = tempo (90/60)

-- ==========================================
-- 1. SOPRANO (Melody)
-- ==========================================
soprano :: Music Pitch
soprano = line [
    -- Verse 1
    a 4 en, g 4 sn, f 4 qn, c 4 en, f 4 en, a 4 qn, a 4 qn, g 4 en, fs 4 sn, g 4 qn, 
    bf 4 en, a 4 sn, g 4 qn, d 4 qn, g 4 qn, f 4 qn, e 4 qn, e 4 en, d 4 sn, c 4 qn,
    e 4 en, c 4 sn, f 4 qn, e 4 en, f 4 en, c 5 qn, bf 4 qn, a 4 en, a 4 sn, g 4 qn,
    bf 4 en, d 5 sn, c 5 qn, f 4 qn, bf 4 en, a 4 sn, g 4 en, f 4 sn, f 4 qn, e 4 en, e 4 sn, f 4 hn,
    -- Chorus
    c 5 en, d 5 sn, d 5 qn, a 4 qn, bf 4 qn, c 5 qn, bf 4 qn, bf 4 en, bf 4 sn, bf 4 qn,
    bf 4 en, c 5 sn, c 5 qn, g 4 qn, a 4 qn, bf 4 qn, bf 4 qn, a 4 en, gs 4 sn, a 4 qn,
    c 4 en, f 4 sn, f 4 qn, e 4 en, f 4 en, c 5 qn, bf 4 qn, a 4 en, a 4 sn, g 4 qn,
    bf 4 en, d 5 sn, c 5 qn, f 4 qn, bf 4 en, a 4 sn, g 4 en, f 4 sn, f 4 qn, e 4 en, e 4 sn, f 4 hn
    ]

-- ==========================================
-- 2. ALTO
-- ==========================================
alto :: Music Pitch
alto = line [
    -- Verse 1
    f 4 en, f 4 sn, e 4 qn, c 4 en, c 4 en, f 4 qn, f 4 qn, e 4 en, ds 4 sn, e 4 qn,
    g 4 en, f 4 sn, e 4 qn, b 3 qn, e 4 qn, d 4 qn, c 4 qn, c 4 en, b 3 sn, c 4 qn,
    c 4 en, c 4 sn, c 4 qn, c 4 en, c 4 en, e 4 qn, d 4 qn, f 4 en, f 4 sn, e 4 qn,
    g 4 en, f 4 sn, e 4 qn, d 4 qn, g 4 en, f 4 sn, e 4 en, d 4 sn, c 4 qn, c 4 en, c 4 sn, c 4 hn,
    -- Chorus
    a 4 en, f 4 sn, f 4 qn, f 4 qn, g 4 qn, g 4 qn, f 4 qn, f 4 en, f 4 sn, f 4 qn,
    g 4 en, g 4 sn, g 4 qn, e 4 qn, f 4 qn, g 4 qn, g 4 qn, f 4 en, f 4 sn, e 4 qn,
    c 4 en, c 4 sn, c 4 qn, c 4 en, c 4 en, e 4 qn, d 4 qn, f 4 en, f 4 sn, e 4 qn,
    g 4 en, f 4 sn, e 4 qn, d 4 qn, g 4 en, f 4 sn, e 4 en, d 4 sn, c 4 qn, c 4 en, c 4 sn, c 4 hn
    ]

-- ==========================================
-- 3. TENOR
-- ==========================================
tenor :: Music Pitch
tenor = line [
    -- Verse 1
    c 4 en, b 3 sn, a 3 qn, a 3 en, a 3 en, c 4 qn, c 4 qn, b 3 en, b 3 sn, b 3 qn,
    d 4 en, c 4 sn, b 3 qn, gs 3 qn, b 3 qn, a 3 qn, g 3 qn, g 3 en, g 3 sn, e 3 qn,
    g 3 en, g 3 sn, a 3 qn, g 3 en, a 3 en, a 3 qn, f 3 qn, c 4 en, c 4 sn, b 3 qn,
    d 4 en, b 3 sn, c 4 qn, a 3 qn, d 4 en, c 4 sn, b 3 en, a 3 sn, a 3 qn, g 3 en, g 3 sn, a 3 hn,
    -- Chorus
    f 4 en, f 4 sn, d 4 qn, c 4 qn, d 4 qn, e 4 qn, d 4 qn, d 4 en, d 4 sn, d 4 qn,
    d 4 en, e 4 sn, e 4 qn, c 4 qn, c 4 qn, d 4 qn, d 4 qn, c 4 en, b 3 sn, c 4 qn,
    g 3 en, g 3 sn, a 3 qn, g 3 en, a 3 en, a 3 qn, f 3 qn, c 4 en, c 4 sn, b 3 qn,
    d 4 en, b 3 sn, c 4 qn, a 3 qn, d 4 en, c 4 sn, b 3 en, a 3 sn, a 3 qn, g 3 en, g 3 sn, a 3 hn
    ]

-- ==========================================
-- 4. BASS
-- ==========================================
bass :: Music Pitch
bass = line [
    -- Verse 1
    f 3 en, f 3 sn, f 3 qn, f 3 en, f 3 en, f 3 qn, f 3 qn, c 3 en, c 3 sn, c 3 qn,
    g 3 en, f 3 sn, e 3 qn, e 3 qn, a 3 qn, d 3 qn, g 3 qn, g 3 en, g 3 sn, c 3 qn,
    c 3 en, c 3 sn, f 3 qn, c 3 en, f 3 en, f 3 qn, d 3 qn, f 3 en, f 3 sn, c 3 qn,
    g 3 en, g 3 sn, a 3 qn, d 3 qn, b 3 en, c 4 sn, g 3 en, f 3 sn, c 3 qn, c 3 en, c 3 sn, f 3 hn,
    -- Chorus
    f 3 en, f 3 sn, bf 3 qn, f 3 qn, bf 3 qn, a 3 qn, bf 3 qn, bf 3 en, bf 3 sn, bf 3 qn,
    g 3 en, g 3 sn, c 4 qn, c 3 qn, f 3 qn, g 3 qn, b 3 qn, c 4 en, c 4 sn, c 3 qn,
    c 3 en, c 3 sn, f 3 qn, c 3 en, f 3 en, f 3 qn, d 3 qn, f 3 en, f 3 sn, c 3 qn,
    g 3 en, g 3 sn, a 3 qn, d 3 qn, b 3 en, c 4 sn, g 3 en, f 3 sn, c 3 qn, c 3 en, c 3 sn, f 3 hn
    ]

-- ==========================================
-- SATB COMBINATION
-- ==========================================
fullHymn :: Music Pitch
fullHymn = hymnTempo (soprano :=: alto :=: tenor :=: bass)

main :: IO ()
main = play fullHymn

```

### What Changed?

1. **Parallel Construction:** The `(:=:)` operator ensures that all four lines run simultaneously instead of sequentially.
2. **Octaves Adjusted:** The Bass and Tenor lines have been shifted down to octaves 3 and 4 to accurately capture the deep choral registers written in the score (such as lower octave notes marked with subscripts like `s,,` and `d,`).

---


To separate the SATB parts into individual MIDI tracks/channels using Euterpea, we use the `instrument` function and the parallel composition operator `(:=:)`.

By default, Euterpea assigns different parts to unique MIDI channels when packaged as discrete parallel tracks. Here, we assign standard choral MIDI instruments (like `AahChoir` or `OohChoir`) or clear synthesizer leads to the individual voice parts so they mix well as independent MIDI voices.

Here is the updated, complete code:

```haskell
module Hymn488 where

import Euterpea

-- Tempo set to a standard 4/4 hymn pace (90 BPM)
hymnTempo :: Music Pitch -> Music Pitch
hymnTempo = tempo (90/60)

-- ==========================================
-- 1. SOPRANO (Melody Voice)
-- ==========================================
soprano :: Music Pitch
soprano = instrument ChoirAahs $ line [
    -- Verse 1
    a 4 en, g 4 sn, f 4 qn, c 4 en, f 4 en, a 4 qn, a 4 qn, g 4 en, fs 4 sn, g 4 qn, 
    bf 4 en, a 4 sn, g 4 qn, d 4 qn, g 4 qn, f 4 qn, e 4 qn, e 4 en, d 4 sn, c 4 qn,
    e 4 en, c 4 sn, f 4 qn, e 4 en, f 4 en, c 5 qn, bf 4 qn, a 4 en, a 4 sn, g 4 qn,
    bf 4 en, d 5 sn, c 5 qn, f 4 qn, bf 4 en, a 4 sn, g 4 en, f 4 sn, f 4 qn, e 4 en, e 4 sn, f 4 hn,
    -- Chorus
    c 5 en, d 5 sn, d 5 qn, a 4 qn, bf 4 qn, c 5 qn, bf 4 qn, bf 4 en, bf 4 sn, bf 4 qn,
    bf 4 en, c 5 sn, c 5 qn, g 4 qn, a 4 qn, bf 4 qn, bf 4 qn, a 4 en, gs 4 sn, a 4 qn,
    c 4 en, f 4 sn, f 4 qn, e 4 en, f 4 en, c 5 qn, bf 4 qn, a 4 en, a 4 sn, g 4 qn,
    bf 4 en, d 5 sn, c 5 qn, f 4 qn, bf 4 en, a 4 sn, g 4 en, f 4 sn, f 4 qn, e 4 en, e 4 sn, f 4 hn
    ]

-- ==========================================
-- 2. ALTO (Alto Voice)
-- ==========================================
alto :: Music Pitch
alto = instrument ChoirAahs $ line [
    -- Verse 1
    f 4 en, f 4 sn, e 4 qn, c 4 en, c 4 en, f 4 qn, f 4 qn, e 4 en, ds 4 sn, e 4 qn,
    g 4 en, f 4 sn, e 4 qn, b 3 qn, e 4 qn, d 4 qn, c 4 qn, c 4 en, b 3 sn, c 4 qn,
    c 4 en, c 4 sn, c 4 qn, c 4 en, c 4 en, e 4 qn, d 4 qn, f 4 en, f 4 sn, e 4 qn,
    g 4 en, f 4 sn, e 4 qn, d 4 qn, g 4 en, f 4 sn, e 4 en, d 4 sn, c 4 qn, c 4 en, c 4 sn, c 4 hn,
    -- Chorus
    a 4 en, f 4 sn, f 4 qn, f 4 qn, g 4 qn, g 4 qn, f 4 qn, f 4 en, f 4 sn, f 4 qn,
    g 4 en, g 4 sn, g 4 qn, e 4 qn, f 4 qn, g 4 qn, g 4 qn, f 4 en, f 4 sn, e 4 qn,
    c 4 en, c 4 sn, c 4 qn, c 4 en, c 4 en, e 4 qn, d 4 qn, f 4 en, f 4 sn, e 4 qn,
    g 4 en, f 4 sn, e 4 qn, d 4 qn, g 4 en, f 4 sn, e 4 en, d 4 sn, c 4 qn, c 4 en, c 4 sn, c 4 hn
    ]

-- ==========================================
-- 3. TENOR (Tenor Voice)
-- ==========================================
tenor :: Music Pitch
tenor = instrument VoiceOohs $ line [
    -- Verse 1
    c 4 en, b 3 sn, a 3 qn, a 3 en, a 3 en, c 4 qn, c 4 qn, b 3 en, b 3 sn, b 3 qn,
    d 4 en, c 4 sn, b 3 qn, gs 3 qn, b 3 qn, a 3 qn, g 3 qn, g 3 en, g 3 sn, e 3 qn,
    g 3 en, g 3 sn, a 3 qn, g 3 en, a 3 en, a 3 qn, f 3 qn, c 4 en, c 4 sn, b 3 qn,
    d 4 en, b 3 sn, c 4 qn, a 3 qn, d 4 en, c 4 sn, b 3 en, a 3 sn, a 3 qn, g 3 en, g 3 sn, a 3 hn,
    -- Chorus
    f 4 en, f 4 sn, d 4 qn, c 4 qn, d 4 qn, e 4 qn, d 4 qn, d 4 en, d 4 sn, d 4 qn,
    d 4 en, e 4 sn, e 4 qn, c 4 qn, c 4 qn, d 4 qn, d 4 qn, c 4 en, b 3 sn, c 4 qn,
    g 3 en, g 3 sn, a 3 qn, g 3 en, a 3 en, a 3 qn, f 3 qn, c 4 en, c 4 sn, b 3 qn,
    d 4 en, b 3 sn, c 4 qn, a 3 qn, d 4 en, c 4 sn, b 3 en, a 3 sn, a 3 qn, g 3 en, g 3 sn, a 3 hn
    ]

-- ==========================================
-- 4. BASS (Bass Voice)
-- ==========================================
bass :: Music Pitch
bass = instrument VoiceOohs $ line [
    -- Verse 1
    f 3 en, f 3 sn, f 3 qn, f 3 en, f 3 en, f 3 qn, f 3 qn, c 3 en, c 3 sn, c 3 qn,
    g 3 en, f 3 sn, e 3 qn, e 3 qn, a 3 qn, d 3 qn, g 3 qn, g 3 en, g 3 sn, c 3 qn,
    c 3 en, c 3 sn, f 3 qn, c 3 en, f 3 en, f 3 qn, d 3 qn, f 3 en, f 3 sn, c 3 qn,
    g 3 en, g 3 sn, a 3 qn, d 3 qn, b 3 en, c 4 sn, g 3 en, f 3 sn, c 3 qn, c 3 en, c 3 sn, f 3 hn,
    -- Chorus
    f 3 en, f 3 sn, bf 3 qn, f 3 qn, bf 3 qn, a 3 qn, bf 3 qn, bf 3 en, bf 3 sn, bf 3 qn,
    g 3 en, g 3 sn, c 4 qn, c 3 qn, f 3 qn, g 3 qn, b 3 qn, c 4 en, c 4 sn, c 3 qn,
    c 3 en, c 3 sn, f 3 qn, c 3 en, f 3 en, f 3 qn, d 3 qn, f 3 en, f 3 sn, c 3 qn,
    g 3 en, g 3 sn, a 3 qn, d 3 qn, b 3 en, c 4 sn, g 3 en, f 3 sn, c 3 qn, c 3 en, c 3 sn, f 3 hn
    ]

-- ==========================================
-- SATB COMBINATION WITH MIDI VOICES
-- ==========================================
fullHymn :: Music Pitch
fullHymn = hymnTempo (soprano :=: alto :=: tenor :=: bass)

-- Outputs directly to a playable MIDI file via Euterpea's engine
main :: IO ()
main = writeMidi "hymn488_satb.mid" fullHymn

```

### Key Changes for MIDI Voices:

* **`instrument` Assignment:** `ChoirAahs` is given to Soprano/Alto, and `VoiceOohs` is given to Tenor/Bass. This maps to the respective General MIDI voice patches (Program #53 and #54), distinguishing the parts nicely.
* **`writeMidi` Export:** Changed `play` to `writeMidi` in `main`. When you run `main`, it will output a balanced `.mid` file named `hymn488_satb.mid` into your working directory with the track layers preserved.
