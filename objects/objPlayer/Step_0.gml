/// @description Insert description here
//TODO: Change to globals
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"))
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"))
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"))
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"))
keyRun = keyboard_check(vk_shift)
keySpace = keyboard_check_pressed(vk_space)
walkSpd = 0.8
hSpd = 0


terminalVSpd = 1
glideSpd = 0.025
runSpd = 1.2
jumpSpd = 5
jumpHeight = 20
doubleJumpHeight = 30
jumpLagSpd = 2

//Horizontal Movement

if keyRun {
	walkSpd = walkSpd * runSpd
}

if keyRight {
	hSpd = walkSpd
}
if keyLeft {
	hSpd = walkSpd * -1
}

if ((tilemap_get_at_pixel(collisionTilemapID, bbox_right + hSpd, bbox_bottom)*tilemap_get_at_pixel(collisionTilemapID, bbox_left + hSpd, bbox_bottom)) = 0) {
	x = x + hSpd
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
		y = y - doubleJumpHeight
		doubleJumped = true
	}
}

if jumping {
	jumped = true
	sprite_index = sprSnakeJump
	image_speed = jumpLagSpd
	print(image_index)
}

//Gravity
if (tilemap_get_at_pixel(collisionTilemapID, bbox_left, bbox_bottom + 1) = 0) && (tilemap_get_at_pixel(collisionTilemapID, bbox_right, bbox_bottom + 1) = 0){
	//in air
	//falling
	if vSpd <= 0 {
		falling = true
		if fallFrameCount <= 10 {
			accelerationSpd = accelerationSpd + gravitySpd
			vSpd = vSpd + accelerationSpd
		} 
		fallFrameCount = fallFrameCount + 1
	} else {
		y = y + vSpd
	}
	
} else {
	//Jump flag
	falling = false
	jumped = false
	doubleJumped = false
	fallFrameCount = 0
	accelerationSpd = 0
}

//Aerial Wall Movement
if wallCling {
	if keyDown {
		y = y + 1
	}
}

wallCling = false