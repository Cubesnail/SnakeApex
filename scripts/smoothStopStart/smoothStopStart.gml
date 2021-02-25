// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function smoothStart(terminal, frames){
//
terminal = argument0
frames = argument1
frameCount = 0
result = array_create(frames)

for (count = 0; count <= frames; count++) {
    result[count] = (count/frames)*(count/frames)
}

return(result)
}