// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ease_linear(current, increment){
	if ((current + increment) < 1){
		return (current + increment)
	}
	return 1
}
function ease_start_quadratic(current,increment){
	if ((current + increment) < 1){
		return (current+increment)*(current+increment)
	}
	return 1
}
function ease_start_cubic(current, increment){
	if ((current + increment) < 1){
		return (current+increment)*(current+increment)*(current+increment)
	}
	return 1
}
function ease_start_quartic(current, increment){
	if ((current + increment) < 1){
		return (current+increment)*(current+increment)*(current+increment)*(current+increment)
	}
	return 1
}

function math_quadratic(float){
	return float*float
}
function math_cubic(float){
	return float*float*float
}
function math_quartic(float){
	return float*float*float*float
}
function math_quintic(float){
	return float*float*float*float*float
}