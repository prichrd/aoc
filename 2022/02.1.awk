#!/bin/awk -f
$1 == "A" { t = 1 } $1 == "B" { t = 2 } $1 == "C" { t = 3 }
$2 == "X" { u = 1 } $2 == "Y" { u = 2 } $2 == "Z" { u = 3 }
(u == 1 && t == 3) || (u == 2 && t == 1) || (u == 3 && t == 2) { sum += u + 6; next }
t == u { sum += u + 3; next }
{ sum += u; next }
END { print sum }
