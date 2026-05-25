# MIDI

- [ ] run `ghci` GHC Interactive

```haskell
import Euterpea
c6dim = c 4 qn :=: e 4 qn :+: d 4 qn :=: f 4 qn :+: e 4 qn :=: g 4 qn :+: f 4 qn :=: gs 4 qn :+: g 4 qn :=: a 4 qn :+: \
        af 4 qn :=: b 4 qn :+: a 4 qn :=: c 5 qn :+: b 4 qn :=: d 5 qn :+: c 5 qn :=: e 5 qn
writeMidi "c6dim.midi" $ c6dim
writeMidi "c-4-qn.midi" $ c 4 qn
:q
```

- [ ] Observe the extracted notes

```sh
hexdump -C c-4-qn.midi
```
>
```
00000000  4d 54 68 64 00 00 00 06  00 00 00 01 00 60 4d 54  |MThd.........`MT|
00000010  72 6b 00 00 00 16 00 c0  00 00 ff 51 03 07 a1 20  |rk.........Q... |
00000020  00 90 3c 7f 60 80 3c 7f  60 ff 2f 00              |..<.`.<.`./.|
0000002c
```

- [ ] Open in MuseScore

```bash
open c-4-qn.midi
```

<image src=images/c-4-qn.png width='20%' height='20%' > </image>

# 🎹 To target your piano, follow this short sequence:

### Step 1: Look up your Roland's Index Number

In GHCi, type the word `devices` to fetch your Mac's current active port layout:

```haskell
ghci> devices

```

Look at the bottom half of the terminal printout under **Output devices**. You will see something like this:

```text

Output devices: 
  OutputDeviceID 4	IAC Driver Bus 1
  OutputDeviceID 5	Network RTP Session 1
  OutputDeviceID 6	UMP Network Network MIDI 2.0 Session 1
  OutputDeviceID 7	FP-30 Bluetooth

```

### Step 2: Use the ID Number

Take the number listed right next to `FP-30` (in the example above, it is `1`) and hand it directly to `playDev`:

```haskell
ghci> playDev 7 music

```

| | |
|-|-|
| <image src=images/FP-30-midi.png width='100%' height='100%' > </image> | <image src=images/FP-30-midi2.png width='100%' height='100%' > </image>

---

## Run `guaguanco.lhs`


### Step 1: Load it in GHCi

Bypass your GNAT path adjustments and fire up GHCi:

```bash
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
ghci guaguanco.lhs

```

Your prompt should now successfully change to `*Main>` without any pre-processor exit codes.

### Step 2: Play the Rhumba!

Now that the instructions are cleanly bundled inside the execution routine, simply type `main` at your prompt to fire the whole sequence off to your Roland piano:

```haskell
*Main> main

```

*(Replace `1` with whichever specific integer index number `devices` assigned to your FP-30 layout during this session).* The moment you run it, GHCi will bypass your Mac’s generic background speakers and map your tracks directly over to your physical keyboard!
