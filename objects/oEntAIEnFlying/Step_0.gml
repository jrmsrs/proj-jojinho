event_inherited();

//3 estados: Scout, Chase/Attack, Return
invincible = currentState==aiFlyingStates.FAINT or currentState==aiFlyingStates.HURT or currentState==aiFlyingStates.HURTFALL or currentState==aiFlyingStates.HURTFALLBACK
onFloor = place_meeting(x,y+6,oWall)
if invincible and !currentState==aiFlyingStates.HURT hurt=0
dirToPlayer = point_direction(x,y,oPlayer.x,oPlayer.y)
dirToOrigin = point_direction(x,y,originX,originY)

switch currentState{
	case aiFlyingStates.SCOUT:
		if sprite_index!=sScout
			alert=false
		sprite_index=sScout
		
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
		
		if (distance_to_object(oPlayer)<=130 or alert) and !oPlayer.invincible
			currentState=aiFlyingStates.CHASE
		if distance_to_point(originX,originY)>=300
			currentState=aiFlyingStates.RETURN
		if hurt 
			currentState=aiFlyingStates.HURT
		if hSpeed!=0 image_xscale = sign(hSpeed)*scale
		break
		
	case aiFlyingStates.CHASE:
		scoutCounter=100
		sprite_index=sChase
		
		if x-oPlayer.x>3 or x-oPlayer.x<-3 
			hSpeed = lengthdir_x(movSpeedChase, dirToPlayer)
		if y-oPlayer.y>3 or y-oPlayer.y<-3 
			vSpeed = lengthdir_y(movSpeedChase, dirToPlayer)
		if (distance_to_object(oPlayer)>maxChaseRange or oPlayer.invincible) and !alert
			currentState=aiFlyingStates.SCOUT
		if distance_to_object(oPlayer)>maxAlertChaseRange
			currentState=aiFlyingStates.SCOUT
		if hurt 
			currentState=aiFlyingStates.HURT
		if hSpeed!=0 
			image_xscale = sign(hSpeed)*scale
		break
		
	case aiFlyingStates.RETURN:
		scoutCounter=100
		
		if distance_to_object(oPlayer)<=maxChaseRange and !oPlayer.invincible
			currentState=aiFlyingStates.CHASE
		if (x>originX-10 and x<originX+10) and (y>originY-10 and y<originY+10)
			currentState=aiFlyingStates.SCOUT
		if hurt 
			currentState=aiFlyingStates.HURT
			
		if x-originX>3 or x-originX<-3 
			hSpeed = lengthdir_x(movSpeed, dirToOrigin)
		if y-originX>3 or y-originX<-3 
			vSpeed = lengthdir_y(movSpeed, dirToOrigin)
		if hSpeed!=0 
			image_xscale = sign(hSpeed)*scale
		break
		
	case aiFlyingStates.HURT:
		selected=1
		scoutCounter=100
		if sprite_index != sHurt{
			shakeScreen(3)
			image_index=0
			if alert{
				hSpeed=0; vSpeed=0
			}	
			life -= hurt - hurt*def 
			lifeTillFaint -= hurt - hurt*def 
		}
		alert=true
		sprite_index = sHurt
		hurt=0
		if image_index>=image_number-1
			currentState=aiFlyingStates.CHASE
		if lifeTillFaint<=0
			currentState=aiFlyingStates.HURTFALL
		if life<=0{
			var corpse = instance_create_layer(x,y-10,"Creatures",oParts)
			corpse.owner=name
			corpse.variant=choose(0,1,2)
			corpse.part=0
			instance_destroy(self)
		}
		break
		
	case aiFlyingStates.HURTFALL:
		hurt=0
		if sprite_index != sHurtFall{
			image_index=0
		}	
		sprite_index=sHurtFall
		
		if image_index>=image_number-3{
			image_index=0
			if onFloor{
				faintTimer=0
				currentState=aiFlyingStates.FAINT
			}
		}
		hSpeed = lerp(hSpeed,0,accel)
		applyGravity()
		break
		
	case aiFlyingStates.FAINT:
		lifeTillFaint=10
		if image_index>=image_number-1
			image_index=image_number-1
		if faintTimer>=15
			hurt=0
			currentState=aiFlyingStates.HURTFALLBACK
		faintTimer++
		hSpeed = lerp(hSpeed,0,accel)
		applyGravity()
		break
	
	case aiFlyingStates.HURTFALLBACK:
		if sprite_index != sHurtFallBack
			image_index=0
		sprite_index = sHurtFallBack
		if image_index>=image_number-1
			currentState=aiFlyingStates.SCOUT
		applyGravity()
		break
	
}

wallCollision()

scoutCounter++
