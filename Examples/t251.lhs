2.3.1 A Simple Example

As a simple example, suppose one wishes to generate a ii-V-I chord progres- sion in a particular key. In music theory, such a chord progression begins with a minor chord on the second degree of a major scale, followed by a major chord on the fifth degree, and ending in a major chord on the first

> import Euterpea

> t251 :: Music Pitch
> t251 = let dMinor = d 4 wn :=: f 4 wn :=: a 4 wn
>            gMajor = g 4 wn :=: b 4 wn :=: d 5 wn
>            cMajor = c 4 bn :=: e 4 bn :=: g 4 bn 
>        in dMinor :+: gMajor :+: cMajor

In major tones

> t251_ :: Music Pitch
> t251_ = let dMinor7 = d 4 wn :=: f 4 wn :=: a 4 wn :=: c 5 wn
>             gMajor7 = g 4 wn :=: b 4 wn :=: d 5 wn :=: f 4 wn
>             cMajor7 = c 4 bn :=: e 4 bn :=: g 4 bn :=: b 4 wn
>         in dMinor7 :+: gMajor7 :+: cMajor7

Exercise 2.2

ap = 60
(absPitch $ pitch ap) == ap

p = (C, 4)
( pitch $ absPitch p ) == p
