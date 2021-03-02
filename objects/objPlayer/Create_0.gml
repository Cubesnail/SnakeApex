/// @description Initialize
// You can write your code in this editor
collisionTilemapID = layer_tilemap_get_id("tmapCollision")
tailID = instance_find(objPlayerTail, 0);
image_speed = 0
jumpAnimationTime =	sprite_get_number(sprSnakeJump)
print(jumpAnimationTime)

walkSpdDefault = 0.8
vSpd = 0
hSpd = 0
gravitySpd = 0.2

accelerationSpd = 0.1
accelerationSpdDefault = 0.1
runSpd = 1.2
jumpSpd = 5
jumpHeight = 20
doubleJumpHeight = 30
jumpLagSpd = 2
walkSpd = walkSpdDefault

framesToTerminal = 10
//gravityArray = smoothStart(1, framesToTerminal)
fallFrameCount = 0