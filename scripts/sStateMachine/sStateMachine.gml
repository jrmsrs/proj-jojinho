function statesInit(){
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
		HIT,
		AIRTTACK,
		HURT,
		HURTFALL,
		HURTFALLBACK,
		FAINT
	}
}

function aiFlyingStatesInit(){
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

function flipToDirection(){
	if hAxis==1 or hAxis==-1 
		image_xscale = hAxis*defaultScale
}
	
function accelDecel(){
	if onFloor {
	    if hAxis != 0 hSpeed = lerp(hSpeed,hAxis * movSpeed,accel)
	    else hSpeed = lerp(hSpeed,0,decel)
	} else { //Accel/Decel in air
	    if hAxis != 0 hSpeed = lerp(hSpeed,hAxis * movSpeed,accelAir)
	    else hSpeed = lerp(hSpeed,0,decelAir)
	}
}

function jump(){

	if jumpPressTime>0 {
		vSpeed = -jumpHeight
		jumpPressTime = 0
	}
	
}

function gravity(){
	//Gravity
	vSpeed += gravityForce
	//limit max falling speed
	if vSpeed>=vSpeedMax vSpeed=vSpeedMax
	
}
	
function wallCollision(){
	//Collision left/right and apply force
	if place_meeting(x+hSpeed,y,oWall) {
	    while(!place_meeting(x+sign(hSpeed),y,oWall)) 
			x+=sign(hSpeed)
	    hSpeed = 0
	}
	
	x+=hSpeed
	//Collision top/down and apply force
	if place_meeting(x,y+vSpeed,oWall) {
	    while(!place_meeting(x,y+sign(vSpeed),oWall)) y+=sign(vSpeed)
	    vSpeed = 0
	}
	
	y+=vSpeed 
}

function wallJump(){
	if place_meeting(x+6,y,oWall) or place_meeting(x-6,y,oWall) {
		if walljumpForce==0 exit
	    if jumpPressTime>0 and !onFloor {
	        vSpeed=-jumpHeight   
	        if place_meeting(x-6,y,oWall) hSpeed=walljumpForce
	        else hSpeed=-walljumpForce
	        jumpPressTime=0
	    }
	}
}

function resetIfOut(){
	//Reset after outside screen
	if x < 0 or x > room_width or y > room_height {
		vSpeed = 0
		hSpeed = 0
	    x = xstart
	    y = ystart
	}
}
