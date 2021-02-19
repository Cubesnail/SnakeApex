/// @description Insert description here
// You can write your code in this editor
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"))
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"))
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"))
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"))
keyRun = keyboard_check(vk_shift)
keySpace = keyboard_check_pressed(vk_space)
walkSpd = 2
vSpd = 0
gravitySpd = 1
runSpd = 3
jumpSpd = 5
jumpHeight = 20
doubleJumpHeight = 30
	
//Horizontal Movement
if keyRight {
	if (tilemap_get_at_pixel(collisionTilemapID, bbox_right + runSpd, bbox_bottom) = 0){
		
		if keyRun {
			x = x + runSpd
		} else {
			x = x + walkSpd
			walking = true
		}
	}
} else if keyLeft {
	if (tilemap_get_at_pixel(collisionTilemapID, bbox_left - runSpd, bbox_bottom) = 0){
		if keyRun {
			x = x - runSpd
		} else {
			x = x - walkSpd
			walking = true
		}
	} else if falling {
		//wall cling and slide
		wallCling = true
	}
}

//Vertical Movement
if keySpace{
	if !jumped {
		jumped = true
		if (tilemap_get_at_pixel(collisionTilemapID, x, bbox_top - 1) = 0) {
			y = y - jumpHeight
		} 
	} else if (!doubleJumped){
		y = y - doubleJumpHeight
		doubleJumped = true
	}
}
	
//Gravity
if (tilemap_get_at_pixel(collisionTilemapID, bbox_left, bbox_bottom + 1) = 0) && (tilemap_get_at_pixel(collisionTilemapID, bbox_right, bbox_bottom + 1) = 0){
	//in air
	falling = true
	if !wallCling {
	y = y + gravitySpd;
	}
} else {
	//Jump flag
	falling = false
	jumped = false
	doubleJumped = false
	
}

//Aerial Wall Movement
if wallCling && keyDown {
	y = y + 0.5
}

wallCling = false