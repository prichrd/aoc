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

BEGIN {
  n=10;
  for(k=0; k<n; k++) { kr[k]=0; kc[k]=0 }
}

{ dir=$1; steps=$2; }

{
  for(i=0; i<steps; i++) {
    if      (dir == "U") { kr[0]-- }
    else if (dir == "D") { kr[0]++ }
    else if (dir == "L") { kc[0]-- }
    else if (dir == "R") { kc[0]++ }

    for(k=1; k<n; k++) {
      update(ret, kr[k-1], kc[k-1], kr[k], kc[k])
      kr[k] = ret[0]; kc[k] = ret[1];
      if (k==9) {
        visited[kr[k] "," kc[k]] = 1;
      }
    }
  }
}

END { print(length(visited)) }
