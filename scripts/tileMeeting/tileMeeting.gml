// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function object_tile_meeting(object, tilemap, targetx, targety){
//@description: Checks if a tilemap is colliding with an object
//@param: Object
//@param: TileMap
//@param: x
//@param: y
	with (object){
		xtemp = x
		ytemp = y
		x = targetx
		y = targety
		result = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) //Top Right
				||
				tilemap_get_at_pixel(tilemap, (bbox_right+bbox_left)/2, bbox_top) //Top Middle
				||
				tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) //Top Left
				||
				tilemap_get_at_pixel(tilemap, bbox_left, (bbox_top+bbox_bottom)/2) //Middle Left
				||
				tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) //Bottom Right
				||
				tilemap_get_at_pixel(tilemap, (bbox_right+bbox_left)/2, bbox_bottom) //Bottom Middle
				||
				tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) //Bottom Left
				||
				tilemap_get_at_pixel(tilemap, bbox_right, (bbox_top+bbox_bottom)/2) //Middle right
		x = xtemp
		y = ytemp
	}
	return(result)
}