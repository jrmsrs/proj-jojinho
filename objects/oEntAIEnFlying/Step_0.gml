//vai patrulhar um territorio definido no x e y de origem,
//podendo escapar quando persegue o player, mas sempre retornando
//caso esteja muito distante

//3 estados: Scout, Chase/Attack, Return

switch currentState{
	//case s
}


if hSpeed!=0 image_xscale=scale*-sign(hSpeed)
//chase
if distance_to_object(oPlayer)<=130{
	scoutCounter=100
	movSpeed=movSpeedChase
	sprite_index=sDemoChase
	hSpeed= -sign(x-oPlayer.x)*movSpeed
	vSpeed= -sign(y-oPlayer.y)*movSpeed
}else{
	movSpeed=movSpeedScout
	sprite_index=sDemoScout
	if scoutCounter>=100{
		hSpeed= choose(1,-1)*movSpeed
		vSpeed= choose(1,-1)*movSpeed
		scoutCounter=0
	}
	if place_meeting(x+hSpeed,y,oWall) or x<=0 or x>=room_width{
		hSpeed=-hSpeed
		scoutCounter=0
	}
	if place_meeting(x,y+vSpeed,oWall) or y<=0 or y>=room_width{
		vSpeed=-vSpeed
		scoutCounter=0
	}
}

wallCollision()

scoutCounter++