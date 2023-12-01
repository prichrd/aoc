#!/bin/awk -f
BEGIN {
  nums[1]="one"
  nums[2]="two"
  nums[3]="three"
  nums[4]="four"
  nums[5]="five"
  nums[6]="six"
  nums[7]="seven"
  nums[8]="eight"
  nums[9]="nine"
}

{
  split($0, sp, "");
  p1 = 1; p2 = length($0);
  d1 = 0; d2 = 0;
  while (p1 <= p2) {
    if (d1 != 0 && d2 != 0) {
      break
    }

    if (d1 == 0) {
      if (sp[p1]*1 != 0) { d1 = sp[p1]; continue; }
      # Why would someone loop when they can copy paste
      if (substr($0, p1, length(nums[1])) == nums[1]) { d1 = 1; continue }
      if (substr($0, p1, length(nums[2])) == nums[2]) { d1 = 2; continue }
      if (substr($0, p1, length(nums[3])) == nums[3]) { d1 = 3; continue }
      if (substr($0, p1, length(nums[4])) == nums[4]) { d1 = 4; continue }
      if (substr($0, p1, length(nums[5])) == nums[5]) { d1 = 5; continue }
      if (substr($0, p1, length(nums[6])) == nums[6]) { d1 = 6; continue }
      if (substr($0, p1, length(nums[7])) == nums[7]) { d1 = 7; continue }
      if (substr($0, p1, length(nums[8])) == nums[8]) { d1 = 8; continue }
      if (substr($0, p1, length(nums[9])) == nums[9]) { d1 = 9; continue }
      p1++
    }

    if (d2 == 0) {
      if (sp[p2]*1 != 0) { d2 = sp[p2]; continue; }
      # Why would someone loop when they can copy paste
      if (substr($0, p2 - length(nums[1]) + 1, length(nums[1])) == nums[1]) { d2 = 1; continue }
      if (substr($0, p2 - length(nums[2]) + 1, length(nums[2])) == nums[2]) { d2 = 2; continue }
      if (substr($0, p2 - length(nums[3]) + 1, length(nums[3])) == nums[3]) { d2 = 3; continue }
      if (substr($0, p2 - length(nums[4]) + 1, length(nums[4])) == nums[4]) { d2 = 4; continue }
      if (substr($0, p2 - length(nums[5]) + 1, length(nums[5])) == nums[5]) { d2 = 5; continue }
      if (substr($0, p2 - length(nums[6]) + 1, length(nums[6])) == nums[6]) { d2 = 6; continue }
      if (substr($0, p2 - length(nums[7]) + 1, length(nums[7])) == nums[7]) { d2 = 7; continue }
      if (substr($0, p2 - length(nums[8]) + 1, length(nums[8])) == nums[8]) { d2 = 8; continue }
      if (substr($0, p2 - length(nums[9]) + 1, length(nums[9])) == nums[9]) { d2 = 9; continue }
      p2--
    }
  }

  sum += d1 * 10 + d2;
}

END { print sum }
