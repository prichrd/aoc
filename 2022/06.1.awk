#!/bin/awk -f

{ split($0, sp, "") }
{
  for(i=1; i<length(sp); i++) {
    freq[sp[i]]++;
    if (i > 4) {
      freq[sp[i-4]]--;
      if (freq[sp[i-4]] == 0) {
        delete freq[sp[i-4]]
      }
    }
    if (length(freq) == 4) {
      next;
    }
  }
}

END {
  print(i);
}
