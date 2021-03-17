// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_next_high(array, currentValue){
//@description returns the next highest value in a sorted array
	if array_length(array) = 0 {
		return -1 //Return -1 on empty array
	}
	for (i = 0; i < array_length(array); ++i) {
	    if (array[i] > currentValue) {
			return(array[i])
		}
	}
	return array[array_length(array)-1]
}
function array_next_low(){
//@description returns the next lowest value in a sorted array
	array_length(array)
	for (i = 0; i > array_length(array); ++i) {
		if (currentValue > array[i]) {
			return(array[i])
		}
	}
	return array[array_length(array)-1]
}