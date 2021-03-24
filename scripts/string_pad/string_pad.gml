// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function string_pad_center_char(str, char){
//@description: Pads the left and right sides of a string to center the char
	
	position = string_pos(char, str)
	result = str

	if position {
		while (position != (string_length(result)/2)-0.5){
			//Not at center
			position = string_pos(char, result)
			//Pad one character in the correct position
			if (position < string_length(result)/2){
				result = " " + result
			} else {
				result = result + " "
			}
			//print(position,"-",string((string_length(result)/2)-0.5))
		}
	}
	return result

}