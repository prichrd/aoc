#!/usr/bin/perl

%nums = (
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9
);

sub is_number {
  return $_[0] =~ m/^[0-9]$/
}

$sum = 0;

while (<>) {
  @sp = split(//, $_);
  $p1 = 0;
  $p2 = $#sp-1;
  $d1 = 0;
  $d2 = 0;

  while ($p1<=$p2) {
    if ($d1 != 0 && $d2 != 0) {
      last;
    }

    if ($d1 == 0) {
      if (is_number $sp[$p1]) { $d1=int($sp[$p1]); next; }
      foreach my $key (keys %nums) {
        $n=$nums{$key};
        if (substr($_, $p1, length($key)) eq $key) {
          $d1 = $n;
          last;
        }
      }
      $p1++;
    }

    if ($d2 == 0) {
      if (is_number $sp[$p2]) { $d2=int($sp[$p2]); next; }
      foreach my $key (keys %nums) {
        $n=$nums{$key};
        if (substr($_, $p2 - length($key) + 1, length($key)) eq $key) {
          $d2 = $n;
          last;
        }
      }
      $p2--;
    }
  }

  $sum += $d1 * 10 + $d2;
}

print $sum
