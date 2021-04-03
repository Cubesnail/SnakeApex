/// @description Displays player variables
function var_display(title, variable){
	return string_pad_center_char((title + ": " + string(variable)),":")
}
function bol_display(title, boolean){
	if boolean {
		return(string_pad_center_char(title + ": true",":"))
	} else {
		return(string_pad_center_char(title + ": false",":"))
	}
}

draw_set_font(fntNovember);
draw_set_color(c_white);
draw_set_halign(fa_center);
//draw_text(x, y, string_pad_center_char(("Falling" + ": " + string(playerID.falling)),":"))
draw_text(x, y, var_display("Falling", global.playerID.falling))
i = 16
draw_text(x, y + i, var_display("Grounded", global.playerID.grounded))
i += 16
draw_text(x, y + i, var_display("Image_angle", string(point_direction(global.playerID.x, global.playerID.y, mouse_x, mouse_y))))
i += 16
draw_text(x, y + i, bol_display("In Air", global.playerID.inAir))
i += 16
draw_text(x, y + i, bol_display("Sliding", global.playerID.sliding))
i += 16
draw_text(x, y + i, bol_display("Running", global.playerID.running))
i += 16
draw_text(x, y + i, bol_display("doubleJumped", global.playerID.doubleJumped))
i += 16
draw_text(x, y + i, bol_display("jumping", global.playerID.jumped))
i += 16
draw_text(x, y + i, bol_display("wallJumped", global.playerID.wallJumped))
i += 16
draw_text(x, y + i, var_display("wallJumpCount", global.playerID.wallJumpCount))
i += 16
draw_text(x, y + i, var_display("wallJumphSpd", global.playerID.wallJumpEntryhSpd))
i += 16