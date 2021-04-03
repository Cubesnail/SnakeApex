/// @description Initialize
// You can write your code in this editor
global.playerID = id //Setting player id for other objects to reference

//DEBUG-----------------------------------
room_speed = 60 //Debugging: default is 60
xPositionList = ds_list_create()
yPositionList = ds_list_create()
positionListSize = room_speed * 5 //Save the last 5 seconds of positions

collisionTilemapID = layer_tilemap_get_id("tmapCollision")
tailID = instance_find(objPlayerTail, 0);		//Player tail
image_speed = 0
jumpAnimationTime =	sprite_get_number(sprSnakeJump)

vSpd = 0	
hSpd = 0
//-------------------------------------------VARIABLE DECLARATION------------------------------------------------


//-----------------------MOVEMENT--------------
//-----Horizontal Movement
walkSpdDefault = 0.8				//Walking speed
runSpdDefault = 1.2
crawlSpd = 0.4					//Crawling speed
airFriction = 0.01
//gravitySpd = 0					//Linear increase in velocity 
fallFramesToTerminal = 60		//Amount of time (in frames) to get to terminal velocity

jumpLagSpd = 7					
walkSpd = walkSpdDefault		//Walking speed
runSpd = runSpdDefault			
jumpTakeoffSpd = 2	
doubleJumpTakeoffSpd = 2
fallFrameCount = 0				//Amount of frames after jump apex
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

slideBoostThreshold = runSpd			//Minimum speed required for a slide boost
slideBoostSpd = 3*walkSpd				//Slide boost speed

airStrafeSpd = 0.01			//Air control speed
maxAirStrafeSpd = runSpd


//-----Jumping
jumpFallSpd = 0.1				//Decrease in vSpd before apex of the jump
runSpd = walkSpdDefault * 1.5	//Sprinting speed
jumpSpd = 5						//Initial Jump speed
jumpHeight = 20					//Maximum jump height
doubleJumpHeight = 30			//Double jump height


// Wall Jumps
wallJumpCount = 0				//Counter for frames after colliding with vertical wall
wallJumpTimer = 10				//Amount of frames wall jumping is available
wallJumpThreshold = walkSpd / 2	//Minimum amount of H speed required for a wall jump
wallJumpEntryhSpd = 0			//H spd the user collided with the wall


wallJumpTakeoffSpd = jumpTakeoffSpd
//-----Flags
dashRight = false
dashLeft = false				//User has dashed left
inAir = false					//user is in the air
sliding = false					//user is sliding
grounded = false				//user is on a surface
running = false					//user is running
wallJumped = false				//user has wall jumped



//------------------------------------------FUNCTIONS-----------------------------------------------------------

//
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


//-----------SLOPE TESTING
wallx1 = 100
wally1 = 200
wallx2 = 300
wally2 = 100


