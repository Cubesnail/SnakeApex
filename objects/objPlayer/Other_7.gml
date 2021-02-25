/// @description Insert description here
// You can write your code in this editor
//Jump End
//


if jumping {
	image_index = 0
	sprite_index = sprSnake
	image_speed = 0
	//y = y - 50
	if (tilemap_get_at_pixel(collisionTilemapID, x, bbox_top - 1) = 0) {
		y = y - jumpHeight
	}
	jumping = false
	vSpd = -5
}