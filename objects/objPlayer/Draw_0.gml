/// @description Insert description here
// You can write your code in this editor
draw_self();
//-------------------------------------------------------------SLOPE TESTING
draw_set_color(c_green)
//draw_line(wallx1, wally1, wallx2, wally2)
//DEBUG---------------------
for (i = 1; i < ds_list_size(xPositionList); i ++){
	draw_line_width(xPositionList[| i-1], yPositionList[| i-1] + sprite_height, xPositionList[| i], yPositionList[| i] + sprite_height, 2)
}
