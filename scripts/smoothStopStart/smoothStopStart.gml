// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//Yes I know this is hideous... Maybe it won't be one day

function smoothSquaredStart(arrayLength, array){
	//@description returns an array from 0 to 1 at the given length at x^2
	//@param arrayLength 
	var i //Counter
	for (var i = 0; i < arrayLength; ++i) {
	    array[@ i] = (i/arrayLength) * (i/arrayLength)
	}
}

function smoothCubedStart(arrayLength){
	//@description returns an array from 0 to 1 at the given length at x^3
	//@param arrayLength 
	var i //Counter
	for (var i = 0; i < arrayLength; ++i) {
	    result[i] = (i/arrayLength) * (i/arrayLength) * (i/arrayLength)
	}
	return result
}

function smoothQuarticStart(arrayLength){
	//@description returns an array from 0 to 1 at the given length at x^4
	//@param arrayLength 
	var i //Counter
	for (var i = 0; i < arrayLength; ++i) {
	    result[i] = (i/arrayLength) * (i/arrayLength) * (i/arrayLength) * (i/arrayLength)
	}
	return result
}

function smoothQuinticStart(arrayLength){
	//@description returns an array from 0 to 1 at the given length at x^5
	//@param arrayLength 
	var i //Counter
	for (var i = 0; i < arrayLength; ++i) {
	    result[i] = (i/arrayLength) * (i/arrayLength) * (i/arrayLength) * (i/arrayLength) * (i/arrayLength)
	}
	return result
}
