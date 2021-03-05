/// @description Insert description here
// You can write your code in this editor
draw_set_colour(c_white);
//draw_point(100,100);
//draw_line(50,150,150,150);
fallSquaredSpd = playerID.fallSquaredSpd
walkSpd = playerID.walkSpd


for (i = 0; i < 100; i++){
	//draw_point(x + i, y + (jumpArray[i]*100))
	if (i > 0){
		draw_line(x + i- 1, y + (jumpArray[i - 1]*100), x + i, y + (jumpArray[i]*100))
	}
}
--i
fallx = x + i
fally = y + (jumpArray[i]*100)
ploty = 0
vSpd = 0
for (i = 0; i < fallFramesToTerminal; i += walkSpd){
	
	vSpd = fallArray[i] * fallSquaredSpd
	ploty += vSpd
	draw_point(fallx + i, fally + ploty)
	
	
	//if (i > 0){
		//draw_line(fallx + i- 1, fally + (fallArray[i - 1]*fallSquaredSpd*100), fallx + i, fally + (fallArray[i]*fallSquaredSpd*100))
	//}
}