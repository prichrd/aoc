#!/bin/awk -f

BEGIN{ pos=0 }
nstacks == 0 {nstacks = ((length($0)+1)/3)-1 }

length($0) == 0 {pstep++; next;}
pstep == 0 {
  split($0, sp, "");
  for(i=1; i<=nstacks; i++) {
    e = sp[(i*4) - 2]
    if (e != "" && e != " ") {
      st[i,",",pos] = e
      if (!(i in idx)) {
        idx[i] = pos;
      }
    }
  }
  pos++;
  next;
}

{
  nb=$2; from=$4; to=$6;
  for(i=0; i<nb; i++) {
    idx[to]--;
    st[to,",",idx[to]] = st[from,",",idx[from]];
    idx[from]++;
  }
}

END {
  for(i=1; i<=nstacks; i++) {
    printf("%s", st[i,",",idx[i]])
  }
  printf("\n");
}
