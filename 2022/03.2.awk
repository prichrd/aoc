#!/bin/awk -f

BEGIN{
  for(i=0; i<26; i++) lookup[sprintf("%c", 97+i)] = i + 1;
  for(i=0; i<26; i++) lookup[sprintf("%c", 65+i)] = 26 + i + 1;
}
{ delete tr; delete chars; }
{
  split($1, tr, "");
  delete tr[0];
  for(k in tr) {
    chars[tr[k]]++;
  }
}
{
  for(k in chars){
    freq[k]++;
  }
  ac++;
}
ac == 3 {
  for(k in freq) {
    if (freq[k] == 3) {
      sum += lookup[k]
    }
  }
  delete freq;
  ac=0;
}
END{ print(sum) }
