//work out the left and right limits


function setPlayerVariable(value){
	global.playerID.fallWeightQuadratic = value
}
playerVariableDefault = global.playerID.fallWeightQuadratic

title = "Quintic"

leftLimit = bbox_left + 1
rightLimit = bbox_right - 3
//create the slider for this bar and assign it some values
sliderID = instance_create_layer(x, y, layer, objSliderButton);


sliderID.rightLimit = rightLimit;
sliderID.leftLimit = leftLimit;
sliderID.x = leftLimit + 50;
playerID  = instance_find(objPlayer, 0);
print(playerID)