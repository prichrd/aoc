#!/usr/bin/perl

sub trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

$card = 1;
@card_count = ();
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

  $c = 0;
  foreach ( @game_numbers ) {
    if (exists $wm{int($_)}) {
      $c++;
    }
  }

  @card_count[$card]++;
  for (my $i = 1; $i <= $c; $i++) {
    @card_count[$card+$i] = @card_count[$card+$i] + @card_count[$card];
  }
  $card++;
}

$sum = 0;
for (my $i = 1; $i <= $#card_count; $i++) {
  $sum += $card_count[$i];
}

print($sum);
