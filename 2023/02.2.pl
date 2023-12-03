#!/usr/bin/perl

$sum = 0;

GAME: while (<>) {
  /^Game (\d+):((( ([0-9]+) (blue|red|green),?)+;?)+)/gi;
  my $game = $1;
  my @groups = split(/;/, $2);

  my %maxes = (
    'red' => 0,
    'green' => 0,
    'red' => 0
  );

  foreach (@groups) {
    my @blocks = split(/,/, $_);
    foreach (@blocks) {
      my ($tmp, $count, $color) = split(/ /, $_);
      if (int($count) > $maxes{$color}) {
        $maxes{$color} = int($count);
      }
    }
  }

  $p = 1;
  foreach $key (keys %maxes) {
    $p *= $maxes{$key};
  }
  $sum += $p;
}

print $sum;
