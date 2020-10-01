# MIDI


```zsh
% ghci
Prelude> import Euterpea
Prelude> writeMidi "test.mid" $ c 4 qn
Prelude> :q
```

```zsh
% hexdump -c c-4-qn.midi | less
```
