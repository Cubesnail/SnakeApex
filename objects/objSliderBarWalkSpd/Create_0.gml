//work out the left and right limits
playerVariable = playerID.walkSpd
playerVariableDefault = playerID.walkSpdDefault
leftLimit = bbox_left + 2
rightLimit = bbox_right - 3
//create the slider for this bar and assign it some values
sliderID = instance_create_layer(x, y, layer, objSliderButton);


sliderID.barLength = 100;
sliderID.rightLimit = rightLimit;
sliderID.leftLimit = leftLimit;
sliderID.x = leftLimit + 50;
playerID  = instance_find(objPlayer, 0);
/* */
/*  */
