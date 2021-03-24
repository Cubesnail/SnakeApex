// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plotter(object, width, height, title, maxValue, minValue){
/// @description draws a plot
	with object{

		draw_set_color(c_white)

		//Draw bounding box
		draw_line(x, y, x + width, y) //Top
		draw_line(x + width, y, x + width, y + height)//Right
		draw_line(x, y + height, x + width, y + height)//Bottom
		draw_line(x, y, x, y + height) //Left

		if counter >= width+x {
			counter = x + 1
		} else {
			counter++
		}
		draw_set_color(c_green)
		draw_line(counter, y, counter, y + height)
	}
}