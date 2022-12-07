#!/bin/awk -f

function join(source, join_char) {
  dest = ""
  for (i=0; i<length(source); i++) {
    if (i == length(source) - 1) { dest = dest source[i]}
    else { dest = dest source[i] join_char }
  }
  return dest
}

BEGIN { delete vpwd[0] }

$1 == "dir" { next }
$1 == "$" && $2 == "cd" && $3 != ".." { vpwd[length(vpwd)] = $3 }
$1 == "$" && $2 == "cd" && $3 == ".." { delete vpwd[length(vpwd)-1] }
$1 == "$" && $2 == "cd" { pwd = join(vpwd, "."); next }
$1 == "$" { next }

{
  delete tpvwd;
  for (k in vpwd) {
    tpvwd[k] = vpwd[k];
    dir_sizes[join(tpvwd, ".")] += $1
  }
}

END {
  for (k in dir_sizes) {
    if (dir_sizes[k] <= 100000) {
      sum += dir_sizes[k]
    }
  };
  print(sum);
}

