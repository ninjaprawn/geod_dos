# `geod` Denial of Service

Completely random bug. Apple doesn't know about it (yet, 04 Feb 17).

Also `geod` comes straight back up after the crash.

Details on [the Medium post](https://medium.com/@theninjaprawn/breaking-ios-xpc-cfe2c3083c87).

---

PoC code in `geod_dos.m`

**Vulnerable code**:

![the vulnerable code](https://cdn-images-1.medium.com/max/800/1*JtTDlnz_KElntE18jKnGaQ.png)

**Crash**:

![the crash](http://i.imgur.com/CrIWnMx.png)

**Potential patch**: type checking :)
