function applyGravity(gf=gravityForce,vm=vSpeedMax){
	//Gravity
	vSpeed += gf
	//limit max falling speed
	if vSpeed>=vm vSpeed=vm
	
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

function shakeScreen(force,dir=all){
	var shake = instance_create_layer(x,y,layer,oShake)
	shake.force=force
	shake.dir=dir
}

function setMusicInit(){
	enum music{
		TITLE,
		A,
		B,
		PRE_BOSS,
		BOSS,
		END
	}
}

function setMusic(music){
	global.previMusic=global.actualMusic
	oMusic.mus=music
}