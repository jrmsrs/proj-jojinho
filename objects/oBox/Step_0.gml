if place_meeting(x+10,y,oPlayer) or place_meeting(x-10,y,oPlayer){
	if oPlayer.currentState == 4
		hSpeed=movSpeed*sign(x-oPlayer.x)
	
}else{
	hSpeed=0
}

if place_meeting(x+3,y-10,oWall) or place_meeting(x-3,y-10,oWall)
	canSlide=true
else 
	canSlide=false

if place_meeting(x,y+6,oWall) {
	if abs(hSpeed)!=0
		hSpeed = lerp(hSpeed,0,.5)
}

wallCollision()
applyGravity()

if timer++ >= 9 timer=0