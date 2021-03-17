
draw_set_font(fntMeatMadness);
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_text(x, y, "Image Angle: " + string(point_direction(global.playerID.x, global.playerID.y, mouse_x, mouse_y)));
