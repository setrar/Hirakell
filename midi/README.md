# MIDI


```zsh
% ghci
Prelude> import Euterpea
Prelude> writeMidi "test.mid" $ c 4 qn
Prelude> :q
```

```zsh
% hexdump -c c-4-qn.midi
00000000  4d 54 68 64 00 00 00 06  00 00 00 01 00 60 4d 54  |MThd.........`MT|
00000010  72 6b 00 00 00 16 00 c0  00 00 ff 51 03 07 a1 20  |rk.........Q... |
00000020  00 90 3c 7f 60 80 3c 7f  60 ff 2f 00              |..<.`.<.`./.|
0000002c
```
