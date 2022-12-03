#!/bin/awk -f

BEGIN{
  for(i=0; i<26; i++) lookup[sprintf("%c", 97+i)] = i + 1;
  for(i=0; i<26; i++) lookup[sprintf("%c", 65+i)] = 26 + i + 1;
}
{ delete spl; delete rs1; delete rs2; delete intersect; c1=0; c2=0; }
{
  split($1, spl, "");
  d = (length(spl))/2 + 1;
  for (i=1; i<=length(spl); i++) {
    if (i < d) {
      rs1[c1++] = spl[i];
    } else {
      rs2[c2++] = spl[i];
    }
  };
  for(k1 in rs1){
    for(k2 in rs2){
      if (rs1[k1] == rs2[k2]) {
        intersect[rs1[k1]]++;
      }
    }
  };
  for(k in intersect){
    sum += lookup[k];
  }
}
END{ print(sum) }
