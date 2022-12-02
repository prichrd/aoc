#!/bin/awk -f
$1 == "" { if (sum > max) { max = sum }; sum = 0 };
{ sum += $1 }
END { print max }
