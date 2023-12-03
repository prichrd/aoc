#!/usr/bin/perl

sub is_number {
  return $_[0] =~ m/^[0-9]$/
}

$sum = 0;

while (<>) {
  @sp = split(//, $_);
  $p1 = 0;
  $p2 = $#sp-1;

  while ($p1<$p2) {
    if (!is_number $sp[$p1]) { $p1++; next; }
    if (!is_number $sp[$p2]) { $p2--; next; }
    last;
  }

  $sum += int($sp[$p1]) * 10 + int($sp[$p2])
}

print $sum
