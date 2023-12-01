#!/bin/awk -f
{
  split($0, sp, "");
  p1 = 1; p2 = length($0);
  while (p1 < p2) {
    if (sp[p1]*1 == 0) { p1++; continue; }
    if (sp[p2]*1 == 0) { p2--; continue; }
    break;
  }
  sum += sp[p1] * 10 + sp[p2];
}
END { print sum }
