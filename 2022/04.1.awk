#!/bin/awk -f

{ split($0, sp, ","); split(sp[1], r1, "-"); split(sp[2], r2, "-") }
{ print(r1[1], r1[2], r2[1], r2[2], r1[1]<=r2[1], r2[2]<=r2[2]) }
r1[1] <= r2[1] && r1[2] >= r2[2] { sum++; next }
r2[1] <= r1[1] && r2[2] >= r1[2] { sum++; next }
END { print sum }

