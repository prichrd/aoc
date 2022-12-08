#!/bin/awk -f

BEGIN { width=0; height=0; }

{height++;}
{width = split($1, row, "")}

{
  for (i=1; i<=width; i++) {
    grid[height "," i] = row[i];
  }
}

END {
  # Top to bottom(ttb) and Left to right (ltr)
  for (j=1; j<=width; j++) { ttbmins[j]=-1 }
  for (i=1; i<=height; i++) {
    ltrmin=-1;
    for (j=1; j<=width; j++) {
      idx = i "," j
      v = grid[idx];
      if (v > ltrmin) {
        ltrmin=v;
        visible[idx]++;
      }

      if (v > ttbmins[j]) {
        ttbmins[j]=v;
        visible[idx]++;
      }
    }
  }

  # Bottom to top(btt) and Right to left (rtl)
  for (j=width; j>0; j--) { bttmins[j]=-1 }
  for (i=height; i>0; i--) {
    rtlmin=-1;
    for (j=width; j>0; j--) {
      idx = i "," j
      v = grid[idx];
      if (v > rtlmin) {
        rtlmin=v;
        visible[idx]++;
      }

      if (v > bttmins[j]) {
        bttmins[j]=v;
        visible[idx]++;
      }
    }
  }

  print(length(visible));
}
