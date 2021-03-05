// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function smoothSquaredStop(arrayLength, array){
	//@description returns an array from 1 to 0 (Backwards) at the given length at x^2
	//@param arrayLength 
	var i //Counter
	var j = 0
	for (var i = arrayLength; i > 0; --i) {
	    array[@ j] = (i/arrayLength) * (i/arrayLength)
		j = j + 1
	}
}
