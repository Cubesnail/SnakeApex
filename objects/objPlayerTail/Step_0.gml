/// @description Insert description here
// You can write your code in this editor
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"))
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"))
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"))
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"))
keyRun = keyboard_check(vk_shift)
keySpace = keyboard_check_pressed(vk_space)



//x = playerID.x
//y = playerID.y
//Image rotation
if (keyRight) {
	image_xscale = 1
	spriteOffset = 0
} else if (keyLeft) {
	spriteOffset = sprite_get_width(sprSnake)
	image_xscale = -1
} 

x = playerID.x + spriteOffset
y = playerID.y

//Animations

if keyDown {
	if (image_index < 8) {
		image_index = image_index + 1
	}
	//print(image_index)
} else {
	if (image_index >= 1){
		image_index = image_index - 1
	}
}
if playerID.jumping {
	//image_alpha = 0
} else {
	image_alpha = 100
}