#!/bin/awk -f

{
  split($0, game_sets_split, ":");
  split(game_sets_split[1], game_split, " ");
  split(game_sets_split[2], sets, ";");

  red=12; green=13; blue=14;
  game=game_split[2]
  for (i = 1; i <= length(sets); i++) {
    set=i;
    split(sets[i], cube_counts, ",");
    for (j = 1; j <= length(cube_counts); j++) {
      split(cube_counts[j], count_color, " ");
      color=count_color[2];
      count=count_color[1];
      if (color == "red" && count > red) { next }
      else if (color == "green" && count > green) { next }
      else if (color == "blue" && count > blue) { next }
    }
  }

  if (red > 0 && green > 0 && blue > 0) {
    sum += game
  }
}

END { print sum }
