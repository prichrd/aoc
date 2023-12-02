#!/bin/awk -f

{
  split($0, game_sets_split, ":");
  split(game_sets_split[1], game_split, " ");
  split(game_sets_split[2], sets, ";");

  game=game_split[2]
  max_red=0; max_green=0; max_blue=0;
  for (i = 1; i <= length(sets); i++) {
    set=i;
    split(sets[i], cube_counts, ",");
    for (j = 1; j <= length(cube_counts); j++) {
      split(cube_counts[j], count_color, " ");
      color=count_color[2];
      count=count_color[1];
      if (color == "red" && count > max_red) { max_red = count }
      if (color == "green" && count > max_green) { max_green = count }
      if (color == "blue" && count > max_blue) { max_blue = count }
    }
  }

  sum += max_red * max_green * max_blue;
}

END { print sum }
