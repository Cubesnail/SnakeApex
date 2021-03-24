/// @description Initialize
// You can write your code in this editor
global.playerID = id //Setting player id for other objects to reference

room_speed = 60 //Debugging


collisionTilemapID = layer_tilemap_get_id("tmapCollision")
tailID = instance_find(objPlayerTail, 0);		//Player tail
image_speed = 0
jumpAnimationTime =	sprite_get_number(sprSnakeJump)

vSpd = 0	
hSpd = 0

walkSpdDefault = 0.8				//Walking speed
runSpdDefault = 1.2
//gravitySpd = 0					//Linear increase in velocity 
fallFramesToTerminal = 60		//Amount of time (in frames) to get to terminal velocity
jumpFallSpd = 0.1				//Decrease in vSpd before apex of the jump
runSpd = walkSpdDefault * 1.5	//Sprinting speed
jumpSpd = 5						//Initial Jump speed
jumpHeight = 20					//Maximum jump height
doubleJumpHeight = 30			//Double jump height
jumpLagSpd = 7					
walkSpd = walkSpdDefault		//Walking speed
runSpd = runSpdDefault			
jumpTakeoffSpeed = 2			
fallFrameCount = 0
fallSquaredSpd = 1.2			//Vertical stretch of the vspeed after the apex of the jump
terminalVelocity = 5			//Terminal Velocity
framesToTerminalVelocity = 60
fallWeightLinear = 1
fallWeightQuadratic = 1
fallWeightCubic = 0
fallWeightQuartic = 0
fallWeightQuintic = 0 
dashTimer = 20					//Amount of time (frames) a person has to doubletap
dashLeftCount = 0				//Counter for input
dashRightCount = 0				//Counter for input
dashRight = false
dashLeft = false
inAir = false
sliding = false
grounded = false
running = false
slideBoostThreshold = 1
slideBoostAmount = 2
crawlSpd = 0.4

function jumpFallArray_get(){
	var totalWeights = fallWeightLinear + fallWeightQuadratic + fallWeightCubic + fallWeightQuartic + fallWeightQuintic
	//{A+B+C+D} where Ax+Bx^2+Cx^3+Dx^4 = vSpd
	for (i = 0; i <= framesToTerminalVelocity; ++i){
		currentFrame = i/framesToTerminalVelocity
		resultArray[i] = 0
		resultArray[i] += fallWeightLinear*currentFrame
		resultArray[i] += fallWeightQuadratic*(math_quadratic(currentFrame))
		resultArray[i] += fallWeightCubic*(math_cubic(currentFrame))
		resultArray[i] += fallWeightQuartic*(math_quartic(currentFrame))
		resultArray[i] += fallWeightQuintic*(math_quintic(currentFrame))
		resultArray[i] = resultArray[i]*terminalVelocity/totalWeights
	}
	return resultArray
}
jumpFallArray = jumpFallArray_get()
	
function vSpd_fall_lerp(currentVelocity){
	return array_next_high(jumpFallArray, currentVelocity)
}

print("Unit tests")
unit_tests()
framesToTerminalVelocityDefault = framesToTerminalVelocity
terminalVelocityDefault = terminalVelocity



