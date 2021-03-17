/// @description Insert description here
// You can write your code in this editor

image_angle = dir
xSpd = lengthdir_x(spd, dir);
ySpd = lengthdir_y(spd, dir);

x += xSpd
y += ySpd

if object_tile_meeting(id, collisionTilemapID, x, y){
	instance_destroy(id)
}