/// @description Insert description here
// You can write your code in this editor
draw_set_colour(c_white);
//draw_point(100,100);
//draw_line(50,150,150,150);
walkSpd = playerID.walkSpd
jumpHeight = 100
fallArray = global.playerID.jumpFallArray
framesToTerminalVelocity = global.playerID.framesToTerminalVelocity
//draw_set_color(c_red)
//display jump height 

vSpd = 0
ploty = 0


for (i = 0; i < framesToTerminalVelocity; i += walkSpd){ 
//Plot the trajectory moving at walking speed
	vSpd = fallArray[i]
	
	if (i > 0){
		draw_line(x + i- walkSpd, y + ploty, x + i, y +ploty + vSpd)
	}
	ploty += vSpd
}

//terminaly = y - vSpd //Coordinate positions for when the fall reaches terminal velocity
//terminalx = x + i - walkSpd
//TODO: Add toggle and tragectory after terminal velocity

//draw_line(terminalx, terminaly + ploty,terminalx + (walkSpd*((jumpHeight - ploty)/vSpd)) ,terminaly + jumpHeight)
/*
for (i = 0; i < 100; i++){
	//draw_point(x + i, y + (jumpArray[i]*100))
	if (i > 0){
		draw_line(x + i- 1, y + (jumpArray[i - 1]*100), x + i, y + (jumpArray[i]*100))
	}
}
--i
fallx = x + i	//Coordinate positions for the apex of the jump
fally = y + (jumpArray[i]*100)
ploty = 0
vSpd = 0

for (i = 0; i < fallFramesToTerminal; i += walkSpd){
	vSpd = fallArray[i]

	//draw_point(fallx + i, fally + ploty)
	
	if (i > 0){
		draw_line(fallx + i- walkSpd, fally + ploty, fallx + i, fally +ploty + vSpd)
	}
	ploty += vSpd
}


terminaly = fally - vSpd //Coordinate positions for when the fall reaches terminal velocity
terminalx = fallx + i - 1 - walkSpd
jumpHeight = 100 //Find out what the jump height is with m a t h
i = 0

draw_line(terminalx, terminaly + ploty,terminalx + (walkSpd*((jumpHeight - ploty)/vSpd)) ,terminaly + jumpHeight)
/*
while (ploty < jumpHeight) {
	ploty += vSpd
	draw_point(terminalx + i, terminaly + ploty)
	i+= walkSpd
}
*/
