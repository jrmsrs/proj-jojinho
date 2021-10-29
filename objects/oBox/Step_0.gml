if place_meeting(x+1,y,oPlayer) or place_meeting(x-1,y,oPlayer){
	if oPlayer.onFloor
		oPlayer.hSpeed=sign(oPlayer.x-x)
	if timer%4==0 
		hSpeed=sign(x-oPlayer.x)
	else
		hSpeed=0
}else{
	hSpeed=0
}

if place_meeting(x+3,y-10,oWall) or place_meeting(x-3,y-10,oWall)
	canSlide=true
else 
	canSlide=false


wallCollision()
applyGravity()

if timer++ >= 9 timer=0