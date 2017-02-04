# `geod` Denial of Service

Completely random bug. Apple doesn't know about it.

Also `geod` comes straight back up after the crash.

---

PoC code in `geod_dos.m`

**Vulnerable code**:

![the vulnerable code](https://cdn-images-1.medium.com/max/800/1*JtTDlnz_KElntE18jKnGaQ.png)

**Potential patch**: type checking :)
