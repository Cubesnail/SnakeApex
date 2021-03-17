/// @description Insert description here
//TODO: Change to globals
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"))
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"))
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"))
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"))
keyRun = keyboard_check(vk_shift)
keySpace = keyboard_check_pressed(vk_space)


runSpd = 1.2
jumpSpd = 5
jumpHeight = 20
doubleJumpHeight = 30
jumpLagSpd = 2
framesToWalkSpd = 5
framesWalkToStop = 5

//Horizontal Movement
if keyRight ^^ keyLeft{		//Check for key left or key right exclusive
	if keyRight {
		if hSpd <= walkSpd {
			hSpd += 1/framesToWalkSpd
		}
	}
	if keyLeft {
		if hSpd >= walkSpd*-1 {
			hSpd -= 1/framesToWalkSpd
		}
	}
} else {	//No horizontal input
	if hSpd >= 0.1{
		hSpd = hSpd * 0.8
	} else {
		hSpd = 0
	}
}
		

if ((tilemap_get_at_pixel(collisionTilemapID, bbox_right + hSpd, bbox_bottom)*tilemap_get_at_pixel(collisionTilemapID, bbox_left + hSpd, bbox_bottom)) = 0) {
	if !jumping{
		image_index = image_index + hSpd
	}
}


//Vertical Movement
if keySpace{
	if !jumped {
		jumping = true
		image_index = 0
	} else if (!doubleJumped){
		//y = y - doubleJumpHeight
		doubleJumped = true
	}
}

if jumping {
	jumped = true
	sprite_index = sprSnakeJump
	image_speed = jumpLagSpd
}

if wallCling {
	if keyDown {
		y = y + 1
	}
}

if(vSpd < 0){
	if !object_tile_meeting(id, collisionTilemapID, x, y - 1) {
		rising = true
		vSpd = vSpd + 0.1
	} else {
		vSpd = 0
		rising = false
	}
} else if( !object_tile_meeting(id, collisionTilemapID, x, y + 1)){
	falling = true
	vSpd = vSpd_fall_lerp(vSpd)
	if(object_tile_meeting(id, collisionTilemapID, x, y + vSpd)){
		vSpd = 1
	}
} else {
	falling = false
	jumped = false
	vSpd = 0
}
	
	
wallCling = false

//Collision checking here please
if !object_tile_meeting(id, collisionTilemapID, x + hSpd, y + vSpd){
	x += hSpd
	y += vSpd
} else if (!object_tile_meeting(id, collisionTilemapID, x + hSpd, y)){
	x += hSpd
} else if (!object_tile_meeting(id, collisionTilemapID, x, y + vSpd)){
	y += vSpd
}	else {
	while (!object_tile_meeting(id, collisionTilemapID, x, y + vSpd)){
		vSpd -= 1
		//print(vSpd, vSpd_fall_lerp(vSpd))
	}
	vSpd = 0
	falling = false
}
jumped = false
jumpFallArray = jumpFallArray_get()
//print(object_tile_meeting(id, collisionTilemapID, x + hSpd, y + vSpd), hSpd, vSpd)
//Horizontal collision checking first
print(terminalVelocity)



/*
//-----------------SHOOTING-------------//

keyMouseRight = mouse_check_button(mb_right)

if keyMouseRight {
	newBullet = instance_create_layer(x,y,layer,objBullet)
	newBullet.dir = point_direction(global.playerID.x, global.playerID.y, mouse_x, mouse_y)
}
*/