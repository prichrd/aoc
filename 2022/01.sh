#!/bin/bash

if [ "$1" -eq 1 ]; then
  awk '
  $1 == "" { if (sum > max) { max = sum }; sum = 0 };
  { sum += $1 }
  END { print max }
  ' $2
else
  awk '
  $1 == "" { sums[sums_len++] = sum; sum = 0 };
  { sum += $1 }
  END {
    asort(sums, sorted);
    print(sorted[sums_len]+sorted[sums_len-1]+sorted[sums_len-2]);
  }
  ' $2
fi
