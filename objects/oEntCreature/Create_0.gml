selected=0
showHealthTimer=0
target=false

//methods
statesInit=function(){
	enum states{
		//humanoid
		IDLEBY,
		IDLE,
		ATTACK,
		SHOOTTACK,
		DASH,
		RUN,
		RUNTTACK,
		AIR,
		AIRTTACK,
		HURT,
		HURTFALL,
		HURTFALLBACK,
		FAINT,
		DEAD
	}
}
aiFlyingStatesInit=function(){
	enum aiFlyingStates{
		SCOUT,
		CHASE,
		RETURN,
		HURT,
		HURTFALL,
		HURTFALLBACK,
		FAINT
	}
}
flipToDirection=function(){
	if hAxis==1 or hAxis==-1 
		image_xscale = hAxis*defaultScale
}
accelDecel=function(){
	if onFloor {
	    if hAxis != 0 hSpeed = lerp(hSpeed,hAxis * movSpeed,accel)
	    else hSpeed = lerp(hSpeed,0,decel)
	} else { //Accel/Decel in air
	    if hAxis != 0 hSpeed = lerp(hSpeed,hAxis * movSpeed,accelAir)
	    else hSpeed = lerp(hSpeed,0,decelAir)
	}
}
jump=function(){
	if (onFloor or canJumpDelay<=5) and jumpPressTime>0 {
		vSpeed = -jumpHeight
		jumpPressTime = 0
	}
}
wallJump=function(){
	if place_meeting(x+6,y,oWall) or place_meeting(x-6,y,oWall) {
		if walljumpForce==0 exit
		var isOnOppositeDirection = place_meeting(x-image_xscale,y,oWall)
	    if jumpPressTime>0 and !onFloor and isOnOppositeDirection {
	        vSpeed=-jumpHeight   
	        if place_meeting(x-6,y,oWall) hSpeed=walljumpForce
	        else hSpeed=-walljumpForce
	        jumpPressTime=0
	    }
	}
}
ifOut=function(){
	if x < -20 or x > room_width+20 or y > room_height+40
		currentState=states.DEAD
}