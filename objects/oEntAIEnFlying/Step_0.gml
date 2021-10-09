//vai patrulhar um territorio definido no x e y de origem,
//podendo escapar quando persegue o player, mas sempre retornando
//caso esteja muito distante

//3 estados: Scout, Chase/Attack, Return

switch currentState{
	case aiFlyingStates.SCOUT:
		movSpeed=movSpeedScout
		sprite_index=sDemoScout
		if scoutCounter>=100{
			hSpeed= choose(1,.5,-.5,-1)*movSpeed
			vSpeed= choose(1,.5,-.5,-1)*movSpeed
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
		if distance_to_object(oPlayer)<=130 and !oPlayer.invincible
			currentState=aiFlyingStates.CHASE
		if distance_to_point(originX,originY)>=300
			currentState=aiFlyingStates.RETURN
		break
		
	case aiFlyingStates.CHASE:
		scoutCounter=100
		movSpeed=movSpeedChase
		sprite_index=sDemoChase
		
		
		if x-oPlayer.x>3 or x-oPlayer.x<-3 
			hSpeed=-sign(x-oPlayer.x)*movSpeed
		if y-oPlayer.y>3 or y-oPlayer.y<-3 
			vSpeed=-sign(y-oPlayer.y)*movSpeed
		
			
		if distance_to_object(oPlayer)>130 or oPlayer.invincible
			currentState=aiFlyingStates.SCOUT
		break
		
	case aiFlyingStates.RETURN:
		scoutCounter=100
		if distance_to_object(oPlayer)<=130 and !oPlayer.invincible
			currentState=aiFlyingStates.CHASE
			
		if (x>originX-10 and x<originX+10) and (y>originY-10 and y<originY+10)
			currentState=aiFlyingStates.SCOUT
			
		if x-originX>3 or x-originX<-3 
			hSpeed=-sign(x-originX)*movSpeed
		if y-originX>3 or y-originX<-3 
			vSpeed=-sign(y-originY)*movSpeed
		break
		
}

wallCollision()

if hSpeed!=0 image_xscale = sign(hSpeed)*scale

//show_debug_message(-sign(x-originX))
//show_debug_message("x_y")
//show_debug_message(-sign(y-originY))
scoutCounter++