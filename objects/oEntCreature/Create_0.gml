selected=0
showHealthTimer=0
target=false

//methods
statesInit=function(){
	enum states{
		//humanoid
		IDLEBY, //0
		IDLE, //1
		ATTACK, //2
		SHOOTTACK, //3
		DASH, //4
		RUN, //5
		RUNTTACK, //6
		AIR, //7
		AIRTTACK, //8
		WALLSLIDE, //9
		HURT, //10
		HURTFALL, //11
		HURTFALLBACK, //12
		FAINT,//13
		DEAD,//14
		//boss-only
		TIRED,//15
		DEFEND//16
	}
}
aiFlyingStatesInit=function(){
	enum aiFlyingStates{
		SCOUT,
		CHASE,
		ATTACK,
		RETURN,
		HURT,
		HURTFALL,
		HURTFALLBACK,
		FAINT,
	}
}
flipToDirection=function(inverse=false){
	if hAxis==1 or hAxis==-1 
		if !inverse image_xscale = hAxis*defaultScale
		else image_xscale = -hAxis*defaultScale
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
	var canWallJump=false
	if walljumpForce==0 exit
	if place_meeting(x+8*-hSpeed,y,oWall) {
		if place_meeting(x-image_xscale,y,oWall){
			canWallJump=true
		}
	}else if currentState==states.WALLSLIDE{
		canWallJump=true
	}
	if canWallJump{
		if jumpPressTime>0 and !onFloor {
	        vSpeed=-jumpHeight
			hAxisLock=true
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
