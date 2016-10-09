# Syntax Guide

```
@collect i in src[A > .5] ->
    i.C = i.A * i.B, \
    {i.D > .5,} =>
    res = mapreduce(isnull, |, :E)
```
