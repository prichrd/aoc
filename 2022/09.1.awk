#!/bin/awk -f

function abs(v) {return v < 0 ? -v : v}

func update(ret, hr, hc, tr, tc) {
  delete ret;

  if (tr == hr && tc < hc && abs(tc-hc) > 1) {
    ret[0] = tr;
    ret[1] = tc+1;
    return;
  }

  if (tr == hr && tc > hc && abs(tc-hc) > 1) {
    ret[0] = tr;
    ret[1] = tc-1;
    return;
  }

  if (tc == hc && tr < hr && abs(tr-hr) > 1) {
    ret[0] = tr+1;
    ret[1] = tc;
    return;
  }

  if (tc == hc && tr > hr && abs(tr-hr) > 1) {
    ret[0] = tr-1;
    ret[1] = tc;
    return;
  }

  if (tr > hr && tc < hc && (abs(tr-hr) + abs(tc-hc)) > 2) {
    ret[0] = tr-1;
    ret[1] = tc+1;
    return;
  }

  if (tr > hr && tc > hc && (abs(tr-hr) + abs(tc-hc)) > 2) {
    ret[0] = tr-1;
    ret[1] = tc-1;
    return;
  }

  if (tr < hr && tc < hc && (abs(tr-hr) + abs(tc-hc)) > 2) {
    ret[0] = tr+1;
    ret[1] = tc+1;
    return;
  }

  if (tr < hr && tc > hc && (abs(tr-hr) + abs(tc-hc)) > 2) {
    ret[0] = tr+1;
    ret[1] = tc-1;
    return;
  }

  ret[0] = tr
  ret[1] = tc
}

BEGIN { hr=0; hc=0; tr=0; tc=0; visited[tr "," tc] = 1; }

{ dir=$1; steps=$2; }

{
  for(i=0; i<steps; i++) {
    if      (dir == "U") { hr-- }
    else if (dir == "D") { hr++ }
    else if (dir == "L") { hc-- }
    else if (dir == "R") { hc++ }

    update(ret, hr, hc, tr, tc)
    tr = ret[0]; tc = ret[1];
    visited[tr "," tc] = 1;
  }
}

END {
  print(length(visited))
}
