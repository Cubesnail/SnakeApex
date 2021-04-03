/// @description Insert description here
//TODO: Change to globals
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"))
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"))
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"))
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"))
keyRun = keyboard_check(vk_shift)

keySpacePressed = keyboard_check_pressed(vk_space)
keySlidePressed = keyboard_check_pressed(vk_lcontrol)
keySpace = keyboard_check(vk_space)
keySlide = keyboard_check(vk_lcontrol)
jumpSpd = 5
jumpHeight = 20
doubleJumpHeight = 30
jumpLagSpd = 2
framesToWalkSpd = 10
framesWalkToStop = 5
dashTimer = 20

//DEBUG-----------
if (ds_list_size(xPositionList) >= positionListSize) {
	ds_list_delete(xPositionList, 0)
	ds_list_delete(yPositionList, 0)
}

ds_list_add(xPositionList, x)
ds_list_add(yPositionList, y)

//Horizontal Movement ------------------------------------------------------------
///Helper functions for getting the right speed

function walk_right(){
	if (abs(hSpd-walkSpd) < 1/framesToWalkSpd){
		hSpd = walkSpd
	} else if hSpd <= walkSpd {
		hSpd += 1/framesToWalkSpd	//Increase speed if moving too slow
	} else {
		hSpd -= 1/framesToWalkSpd*2	//Decrease speed if moving too fast
	}
}
//Rinse and repeat for other target speeds
function run_right(){
	if (abs(hSpd-runSpd) < 1/framesToWalkSpd){
		hSpd = runSpd
	} else if hSpd <= runSpd {
		hSpd += 1/framesToWalkSpd	
	} else {
		hSpd -= 1/framesToWalkSpd*2	
	}
}


function slide_right(){
	if (abs(hSpd-crawlSpd) < 1/framesToWalkSpd){
		hSpd = crawlSpd
	} else if hSpd <= crawlSpd {
		hSpd += 0.02	
	} else {
		hSpd -= 0.02	
	}
}
//And again for left
//Slow down and speed up functions are reversed here
function slide_left(){
	if (abs(hSpd+crawlSpd) < 1/framesToWalkSpd){
		hSpd = -crawlSpd
	} else if hSpd <= crawlSpd*-1 {
		hSpd += 0.02			//Decrease speed if moving too fast
	} else {
		hSpd -= 0.02			//Increase speed if moving too slow
	}
}
function walk_left(){
	if (abs(hSpd+walkSpd) < 1/framesToWalkSpd){
		hSpd = -walkSpd
	} else if hSpd <= walkSpd*-1 {
		hSpd += 1/framesToWalkSpd
	} else {
		hSpd -= 1/framesToWalkSpd
	}
}

function run_left(){
	if (abs(hSpd+runSpd) < 1/framesToWalkSpd){
		hSpd = -runSpd
	} else if hSpd <= runSpd*-1 {
		if abs(hSpd) >= 0.5{
			hSpd = hSpd * 0.95	
		} else {
			hSpd = 0
		}
		
	} else {
		hSpd -= 1/framesToWalkSpd
	}
}

//Sliding
if (!inAir) {
	if keySlidePressed {
		sliding = !sliding
		if sliding {
			sprite_index = sprSnakeSlide
			image_index = 0
			image_speed = 1
			//running = false
			if abs(hSpd) >= slideBoostThreshold {
				hSpd = slideBoostSpd* sign(hSpd)
			}
		}
	}
}

if (keyRun) {
	sprite_index = sprSnake
	image_speed = 0
	running = true
	maxAirStrafeSpd = runSpd
	sliding = false
} else if (keySlide) {
	sliding = true
	maxAirStrafeSpd = walkSpd
	if (image_xscale = 1) {
		sprite_set_offset(sprSnakeSlide, 0, 0)
	} else {
		sprite_set_offset(sprSnakeSlide, sprite_get_width(sprSnake), 0)
	}
	//running = false
} else {
	sprite_index = sprSnake
	image_speed = 0
	sliding = false
	//running = false
}


//Image rotation
//if hSpd > 0 {
//	image_xscale = 1
//	sprite_set_offset(sprSnake, 0, 0)
//} else if hSpd < 0 {
//	image_xscale = -1
//	sprite_set_offset(sprSnake, sprite_get_width(sprSnake), 0)
//}


if (keyRight ^^ keyLeft) {		//Check for key left or key right exclusive
	if (keyRight) {
		if (inAir) {
			if (hSpd < maxAirStrafeSpd) {
				hSpd = hSpd + airStrafeSpd
			}
		} else if (sliding) {
			slide_right()
		} else if (running) { 
			run_right()
		} else {
			walk_right()
		}
		image_xscale = 1
		sprite_set_offset(sprSnake, 0, 0)
	}
	if (keyLeft) {
		if (inAir) {
			if (hSpd > maxAirStrafeSpd * -1) {
				hSpd = hSpd - airStrafeSpd
			}
		} else if (sliding) {
			slide_left()
		} else if (running) {
			run_left()
		} else {
			walk_left()
		}
		image_xscale = -1
		sprite_set_offset(sprSnake, sprite_get_width(sprSnake), 0)
	}
} else {	//No horizontal input
	running = false
	if (inAir) {
		hSpd = hSpd - (airFriction * sign(hSpd))
	} else if (sliding) {
		if (abs(hSpd) >= 0.5) {
			hSpd = hSpd * 0.95				// CHANGE VALUE HERE
			//hSpd -= 1/framesToWalkSpd*2 * sign(hSpd)	
		} else {
			hSpd = 0
		}
	} else {
		if (abs(hSpd) >= 0.1) {
			hSpd = hSpd * 0.8				// CHANGE VALUE HERE
		} else {
			hSpd = 0
		}
	}
}




	//Check for momentum and give a small increase
	

if ((tilemap_get_at_pixel(collisionTilemapID, bbox_right + hSpd, bbox_bottom)*tilemap_get_at_pixel(collisionTilemapID, bbox_left + hSpd, bbox_bottom)) = 0) {
	if !jumping && !sliding {
		image_index = image_index + hSpd
	}
}


//Vertical Movement---------------------------------------------------------------
//Jumping
if (keySpacePressed) {
	if (grounded) {
		//if (tilemap_get_at_pixel(collisionTilemapID, x, bbox_top - jumpHeight) = 0) {
		//	y = y - jumpHeight
		//}
		y -= 1
		jumping = false
		jumped = true
		vSpd = jumpTakeoffSpd*-1
	} else if (wallJumpCount > 1) {
		if !(keyLeft || keyRight) {
			if (!keyUp) {		//Wall jump directly up if user inputted
				hSpd = wallJumpEntryhSpd*-1
			}
			vSpd = -wallJumpTakeoffSpd
		}	
	} else if (!jumped) {
		jumping = true
		vSpd = -jumpTakeoffSpd
		//image_index = 0
	} else if (!doubleJumped){
		//y = y - doubleJumpHeight
		vSpd = -doubleJumpTakeoffSpd
		doubleJumped = true
	}
}

if (jumping) {
	jumped = true
}
if (wallJumpCount >= 1) {
	if (wallJumpCount < wallJumpTimer) {
		wallJumpCount += 1
	} else {
		wallJumpCount = 0
	}
}
if (wallCling) {
	if (keyDown) {
		y = y + 1
	}
}


if (vSpd < 0) {
	if (!object_tile_meeting(id, collisionTilemapID, x, y - 1)) {
		rising = true
		if (keySpace) {
			vSpd = vSpd + 0.06			// CHANGE VALUE HERE: GLIDE SPEED
		} else {
			vSpd = vSpd + 0.15			// CHANGE VALUE HERE: GRAVITY
		}	
	} else {
		vSpd = 0
		rising = false
	}
} else if (!object_tile_meeting(id, collisionTilemapID, x, y + 1)){
	falling = true
	if (keySpace) {
		vSpd = vSpd_fall_lerp(vSpd)
	} else {
		vSpd = vSpd_fall_lerp(vSpd_fall_lerp(vSpd))
	}
	
	if (object_tile_meeting(id, collisionTilemapID, x, y + vSpd)) {
		vSpd = 1
	}
} else {
	
}


if (hSpd = 0) {
	running = false
	sliding = false
}
if (!object_tile_meeting(id, collisionTilemapID, x, y + 1)) {
	inAir = true
	grounded = false
	sliding = false
} else {
	if (inAir) {
		hSpd = hSpd * 0.8		//LANDING HSPD FRICTION
	}
	doubleJumped = false
	grounded = true
	inAir = false
	falling = false
	jumped = false
	rising = false
	wallJumped = false
	wallJumpCount = 0
	vSpd = 0
}


	
wallCling = false

//Collision checking here please
if (!object_tile_meeting(id, collisionTilemapID, x + hSpd, y + vSpd)) {
	//Check for collisions at target coordinates
	x += hSpd
	y += vSpd
} else if (!object_tile_meeting(id, collisionTilemapID, x + hSpd, y)) {
	//Check for collisions at target x coordinate
	x += hSpd
	vSpd = 0
} else if (!object_tile_meeting(id, collisionTilemapID, x, y + vSpd)) {
	//Check for collisions at target y coordinate
	if (inAir) {
		if (!wallJumped && wallJumpCount = 0 && abs(hSpd) > wallJumpThreshold) {
			wallJumpCount = 1
			wallJumpEntryhSpd = hSpd
		}
	}
	hSpd = 0
	y += vSpd
} else {
	while (!object_tile_meeting(id, collisionTilemapID, x, y + vSpd)) {
		vSpd -= 1
	}
	vSpd = 0
	falling = false
}

jumpFallArray = jumpFallArray_get()




//-------------------------------------------------------------SLOPE TESTING
spd = point_distance(0, 0, hSpd, vSpd)
angle  = point_direction(0, 0, hSpd, vSpd)

objectnormalx = lengthdir_x(1, angle)
objectnormaly = lengthdir_y(1, angle)


if collision_line(wallx1, wally1, wallx2, wally2, id, 1, 0)
{

walldirection = point_direction(wallx1, wally1, wallx2, wally2) + 90

surfacenormalx = lengthdir_x(1, walldirection)
surfacenormaly = lengthdir_y(1, walldirection)

}


//Horizontal collision checking first




/*
//-----------------SHOOTING-------------//

keyMouseRight = mouse_check_button(mb_right)

if keyMouseRight {
	newBullet = instance_create_layer(x,y,layer,objBullet)
	newBullet.dir = point_direction(global.playerID.x, global.playerID.y, mouse_x, mouse_y)
}
*/

//DEBUG

