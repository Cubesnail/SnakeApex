/// @description Insert description here
// You can write your code in this editor

playerID = instance_find(objPlayer, 0)
fallFramesToTerminal = playerID.fallFramesToTerminal
fallSquaredSpd = playerID.fallSquaredSpd
var i
//Initialize arrays
for (i = 0; i < 100; ++i){
	fallArray[i] = 0
	jumpArray[i] = 0
}
smoothSquaredStart(fallFramesToTerminal, fallArray)
smoothSquaredStop(100, jumpArray)
