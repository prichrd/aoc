#!/bin/awk -f

func tick(pc, rx, crt) {
  c=(pc-1)%40
  r=int((pc-1)/40)

  if (c == rx-1 || c == rx || c == rx+1) {
    crt[r "," c] = "█"
  } else {
    crt[r "," c] = " "
  }
}

BEGIN { pc=1; rx=1; delete crt[0]; }

$1 == "noop" {
  sum = tick(pc, rx, crt);
  pc++;
  next;
}
$1 == "addx" {
  for(i=0; i<2; i++) {
    sum = tick(pc, rx, crt);
    pc++;
  }
  rx += $2;
  next;
}

END {
  for(r=0; r<6; r++) {
    for(c=0; c<40; c++) {
      printf(crt[r "," c])
    }
    printf("\n")
  }
}
