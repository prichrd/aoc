#!/bin/awk -f

{ split($0, sp, "") }
{
  for(i=1; i<length(sp); i++) {
    freq[sp[i]]++;
    if (i > 14) {
      freq[sp[i-14]]--;
      if (freq[sp[i-14]] == 0) {
        delete freq[sp[i-14]]
      }
    }
    if (length(freq) == 14) {
      next;
    }
  }
}

END {
  print(i);
}
