/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_set_font(fntMeatMadness);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(x, y-20, string_hash_to_newline("B"));
draw_text(x, y+10, string_hash_to_newline("Value: " + string(playerVariableDefault * sliderPercentage/100)));
draw_text(x, y+23, string_hash_to_newline("Percentage: " + string(sliderPercentage) + "%"));