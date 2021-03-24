/// @description Insert description here
//TODO: Change to globals
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"))
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"))
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"))
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"))
keyRun = keyboard_check(vk_shift)
keySpace = keyboard_check_pressed(vk_space)
keySlidePressed = keyboard_check_pressed(vk_lcontrol)
keySlide = keyboard_check(vk_lcontrol)
jumpSpd = 5
jumpHeight = 20
doubleJumpHeight = 30
jumpLagSpd = 2
framesToWalkSpd = 10
framesWalkToStop = 5
dashTimer = 20

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
		hSpd += 0.01	
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
		hSpd -= 0.01			//Increase speed if moving too slow
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

if keyRun{
	running = true
	sliding = false
} else if keySlide{
	sliding = true
	running = false
} else {
	sliding = false
	//running = false
}

//if sliding{
//	image_index = sprSnakeSlide
//	image_speed = 1
//} else {
//	image_index = sprSnake
//	image_speed = 0
//}

if inAir{
	hSpd = hSpd
} else if keyRight ^^ keyLeft{		//Check for key left or key right exclusive
	if keyRight {
		if sliding {
			slide_right()
		} else if running { 
			run_right()
		} else {
			walk_right()
		}
	}
	if keyLeft {
		if sliding {
			slide_left()
		} else if running {
			run_left()
		} else {
			walk_left()
		}
	}
} else {	//No horizontal input
	running = false
	if sliding {
		if abs(hSpd) >= 0.5{
			hSpd = hSpd * 0.95				// CHANGE VALUE HERE
			//hSpd -= 1/framesToWalkSpd*2 * math_sign(hSpd)	
		} else {
			hSpd = 0
		}
	} else {
		if abs(hSpd) >= 0.1{
			hSpd = hSpd * 0.8				// CHANGE VALUE HERE
		} else {
			hSpd = 0
		}
	}
}



//Sliding
if keySlidePressed {
	sliding = !sliding
	if sliding {
		//running = false
		if abs(hSpd) >= slideBoostThreshold {
			hSpd = slideBoostAmount* math_sign(hSpd)
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
if keySpace{
	if !jumped {
		jumping = true
		vSpd = -jumpTakeoffSpeed
		//image_index = 0
	} else if (!doubleJumped){
		//y = y - doubleJumpHeight
		doubleJumped = true
	}
}

if jumping {
	jumped = true
	//sprite_index = sprSnakeJump
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
		vSpd = vSpd + 0.1			// CHANGE VALUE HERE
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
	
}


if hSpd = 0{
	running = false
	sliding = false
}
if( !object_tile_meeting(id, collisionTilemapID, x, y + 1)){
	inAir = true
	grounded = false
	sliding = false
} else {
	grounded = true
	inAir = false
	falling = false
	jumped = false
	rising = false
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
	}
	vSpd = 0
	falling = false
}
jumped = false
jumpFallArray = jumpFallArray_get()

//Horizontal collision checking first




/*
//-----------------SHOOTING-------------//

keyMouseRight = mouse_check_button(mb_right)

if keyMouseRight {
	newBullet = instance_create_layer(x,y,layer,objBullet)
	newBullet.dir = point_direction(global.playerID.x, global.playerID.y, mouse_x, mouse_y)
}
*/