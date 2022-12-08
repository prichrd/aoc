#!/bin/awk -f

BEGIN { width=0; height=0; }

{height++;}
{width = split($1, rowsplit, "")}

{
  for (i=1; i<=width; i++) {
    grid[height "," i] = rowsplit[i];
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

  max=0
  for (pos in visible) {
    split(pos, rc, ",");
    row=rc[1];
    col=rc[2];

    sum1=0; for (i=row+1; i<=height; i++) { sum1++; if (grid[i "," col] >= grid[pos]) { break; } }
    sum2=0; for (i=row-1; i>0; i--)       { sum2++; if (grid[i "," col] >= grid[pos]) { break; } }
    sum3=0; for (i=col+1; i<=width; i++)  { sum3++; if (grid[row "," i] >= grid[pos]) { break; } }
    sum4=0; for (i=col-1; i>0; i--)       { sum4++; if (grid[row "," i] >= grid[pos]) { break; } }

    s[pos] = sum1 * sum2 * sum3 * sum4;
    if (s[pos]>max) {max = s[pos]}
  }

  print(max);
}
