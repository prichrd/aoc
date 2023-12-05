#!/usr/bin/perl

sub trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

$sum = 0;
while (<>) {
  my @gs = split /:/, $_;
  my @cs = split /\|/, @gs[1];
  my @winning_numbers = split / /, @cs[0];
  my @game_numbers = split / /, @cs[1];

  %wm = {};
  foreach ( @winning_numbers ) {
    if ( trim $_ ne "" ) {
      $wm{int($_)} = 1;
    }
  }

  $score = 0;
  foreach ( @game_numbers ) {
    if (exists $wm{int($_)}) {
      if ($score == 0) {
        $score++
      } else {
        $score = $score * 2;
      }
    }
  }

  print("Score: $score\n");
  $sum += $score;
}

print($sum);
