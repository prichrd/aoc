#!/usr/bin/perl

%limits = (
  'red' => 12,
  'green' => 13,
  'blue' => 14
);

$sum = 0;

GAME: while (<>) {
  /^Game (\d+):((( ([0-9]+) (blue|red|green),?)+;?)+)/gi;
  my $game = $1;
  my @groups = split(/;/, $2);

  foreach (@groups) {
    my @blocks = split(/,/, $_);
    foreach (@blocks) {
      my ($tmp, $count, $color) = split(/ /, $_);
      if (int($count) > $limits{$color}) {
        next GAME;
      }
    }
  }
  $sum += $game;
}

print $sum;
