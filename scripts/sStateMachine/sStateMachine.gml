function enumInit(){
	enum states{
		normal,
		attack
	}
}

function normalState(){
	flipMove()
	frictionMove()
	jumpMove()
	gravityMove()
	collisionMove()
	walljumpMove()
	//resetIfOut()
}

function attackState(){
	
}

function flipMove(){
	if hAxis==1 or hAxis==-1 
		image_xscale = hAxis*defaultScale
}
	
function frictionMove(){
	if onFloor {
	    if hAxis != 0 hSpeed = lerp(hSpeed,hAxis * movSpeed,accel)
	    else hSpeed = lerp(hSpeed,0,decel)
	} else { //Accel/Decel in air
	    if hAxis != 0 hSpeed = lerp(hSpeed,hAxis * movSpeed,accelAir)
	    else hSpeed = lerp(hSpeed,0,decelAir)
	}
}

function jumpMove(){
	if jumpPressTime>0 jumpPressTime--
	if groundTime>0 groundTime--
	if onFloor groundTime = groundTimeMax
	if jumpPressTime>0 and groundTime>0 {
	    vSpeed = -jumpHeight
	    jumpPressTime = 0
	    groundTime = 0
	}
}

function gravityMove(){
	//Gravity
	vSpeed += gravityForce
	//limit max falling speed
	if vSpeed>=vSpeedMax vSpeed=vSpeedMax
	
}
	
function collisionMove(){
	//Collision left/right and apply force
	if place_meeting(x+hSpeed,y,oWall) {
	    while(!place_meeting(x+sign(hSpeed),y,oWall)) x+=sign(hSpeed)
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

function walljumpMove(){
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
	
function swapSprite(){
	if hAxis!=0										//Caso esteja se movendo
		if running sprite_index = getSpriteRun()		//Caso esteja se movendo aceleradamente/fixo
		else sprite_index = getSpriteSlide()			//Caso esteja desacelerando
	else sprite_index = getSpriteIdle()				//Caso esteja totalmente parado
	if jumping sprite_index=getSpriteJump()			
	if falling sprite_index=getSpriteJump()
}