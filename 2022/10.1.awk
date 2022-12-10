#!/bin/awk -f

func tick(pc, rx, sum) {
  if ((pc+20)%40 == 0) {
    sum += pc * rx
  }
  return sum
}

BEGIN { pc=1; rx=1; sum=0; }

$1 == "noop" {
  sum = tick(pc, rx, sum);
  pc++;
  next;
}
$1 == "addx" {
  for(i=0; i<2; i++) {
    sum = tick(pc, rx, sum);
    pc++;
  }
  rx += $2;
  next;
}

END { print(sum) }
