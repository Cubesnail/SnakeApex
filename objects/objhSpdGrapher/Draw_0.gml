/// @description 

//Draw Title
draw_set_halign(fa_left)
draw_set_font(fntNovember)
draw_text(x , y - 14,"H Speed")

if keyboard_check_pressed(ord("P")){
	playing = !playing
}
draw_set_color(c_ltgray)

if playing {
	draw_set_color(c_blue)
	}
//Bounding box
draw_line(x, y, x + width, y) //Top
draw_line(x + width, y, x + width, y + height)//Right
draw_line(x, y + height, x + width, y + height)//Bottom
draw_line(x, y, x, y + height) //Left

if playing {
	if counter >= width {
		counter = 0
	} else {
		counter++
	}
	//Set the array
	plotArray[counter] = playerID.hSpd
}

draw_set_color(c_white)

draw_line(x, y + (height/2), width + x, y + (height/2))
//Line at 0

//Gridlines
draw_set_color(c_gray)
for (i = yInterval; i < maxValue; i += yInterval){
	draw_line(x,y + (i/maxValue)*(height/2) + (height/2), x + width,y + (i/maxValue)*(height/2) + (height/2))
	draw_line(x,y + (-i/maxValue)*(height/2) + (height/2), x + width,y + (-i/maxValue)*(height/2) + (height/2))
}

for (i = room_speed; i < width; i += (xInterval*room_speed)){
	draw_line(x + i,y,x + i, y + height)
}

draw_set_color(c_white)
for (i = 0; i < array_length(plotArray);i++){
	if i > 0{
		draw_line(i+x-1, ((plotArray[i-1]/maxValue) * (height /2))+ (height / 2)+ y, i+x, ((plotArray[i]/maxValue) * (height /2))+ (height / 2)+ y)
	}
}

draw_set_color(c_green)

draw_line(counter+x, y, counter+x, y + height)
//current time line
