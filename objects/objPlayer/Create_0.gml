/// @description Initialize
// You can write your code in this editor
collisionTilemapID = layer_tilemap_get_id("tmapCollision")
tailID = instance_find(objPlayerTail, 0);
image_speed = 0
jumpAnimationTime =	sprite_get_number(sprSnakeJump)
print(jumpAnimationTime)

walkSpdDefault = 3 //Walking speed
vSpd = 0
hSpd = 0
gravitySpd = 0.2
fallFramesToTerminal = 60 //Amount of time (in frames) to get to terminal velocity
accelerationSpd = 0.1
jumpFallSpd = 0.1 //Decrease in vSpd before apex of the jump
//accelerationSpdDefault = 0.1
runSpd = walkSpdDefault * 1.2
jumpSpd = 5
jumpHeight = 20
doubleJumpHeight = 30
jumpLagSpd = 2
walkSpd = walkSpdDefault
jumpTakeoffSpeed = 5

//framesToTerminal = 10
//gravityArray = smoothStart(1, framesToTerminal)
fallFrameCount = 0

fallSquaredSpd = 1.2 //Vertical stretch of the vspeed after the apex of the jump


var i
for (i = 0; i < fallFramesToTerminal; ++i){
	fallSpeedArray[i] = 0
}
smoothSquaredStart(fallFramesToTerminal, fallSpeedArray); //Array for the falling speed

