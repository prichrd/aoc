#!/bin/awk -f
$1 == "" { sums[sums_len++] = sum; sum = 0 };
{ sum += $1 }
END {
  asort(sums, sorted);
  print(sorted[sums_len]+sorted[sums_len-1]+sorted[sums_len-2]);
}
