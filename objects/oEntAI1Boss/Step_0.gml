event_inherited();

if !object_exists(oPlayer) exit

function chase(){
	if !oPlayer.invincible 
		hAxis = sign(oPlayer.x-x) 
	else 
		hAxis = -sign(oPlayer.x-x)

	if alert or (distance_to_object(oPlayer) <= 38 and distance_to_object(oPlayer) > 15){
		if oPlayer.invincible 
			return false
		return true
	}
	if place_meeting(x+(distanceSensor*sign(image_xscale)),y,oPlayer){
		return true
	}
	if distanceSensor>=maxRange 
		distanceSensor=0
	distanceSensor+=3
	return false
}

switch(currentState){
	case states.IDLE:
		if sprite_index!=sIdle and sprite_index!=sHurt and sprite_index!=sHurtFallBack
			alert=false
		hAxis=0
		
		if defending
			currentState=states.DEFEND
			
		if iaTimer++ >= iaDelay or chase() or alert{
			iaTimer=0
			iaDelay=choose(50,100,150)
			currentState = states.RUN
			if !oPlayer.invincible hAxis=sign(image_xscale)
			else hAxis=-sign(image_xscale)
		}
		if distance_to_object(oPlayer) <= 40 and sign(oPlayer.x-x)==sign(image_xscale) and !oPlayer.invincible{
			hAxis=0
			attacking=1
		}
		break
		
	case states.RUN:
		if defending
			currentState=states.DEFEND
			
		if iaTimer++ >= 200{
			iaTimer=0
			currentState = states.IDLE
			hAxis=0
			break
		}
		
		hAxis=sign(image_xscale)
	
		//se não houver um chão adiante ou se houver uma parede, inverta a direcao
		if (!place_meeting(x+sign(image_xscale)*16,y+6,oWall) or place_meeting(x+sign(image_xscale)*4,y,oWall)) and onFloor{
			hAxis = -hAxis
			alert=false
		}
		
		if chase()
			iaTimer=0 //temporizador zera enquanto está perseguindo
		
		if distance_to_object(oPlayer)<=40 and !oPlayer.invincible {
			hAxis=0
			currentState = states.IDLE
		}
		break
		
	case states.ATTACK:
		if defending
			currentState=states.DEFEND
		if !layer_exists("BossHitbox")
			layer_create(depth,"BossHitbox")

		instance_create_layer(x,y+3*image_yscale,"BossHitbox",oHitbox)

		if instance_exists(oBullet)
			if distance_to_object(oBullet)<=20{
				instance_destroy(oBullet)
			}
		if !instance_exists(oBullet) and theresABullet{
			if image_index>=3{
				currentState=states.IDLE
				attacking=false
				theresABullet=false
			}
		}
		break
	
	case states.RUNTTACK:
		//sempre vai travar o movimento quando ataca
		if defending
			currentState=states.DEFEND
		currentState=states.ATTACK
		break
		
	case states.DEFEND:
		hSpeed=1*-sign(image_xscale)
		if sprite_index != sDefend{
			sprite_index = sDefend
			image_index=0
			defending=0
		}
		shakeScreen(5)
		if image_index>=image_number-1
			currentState=states.IDLE
		break
			
	case states.TIRED:
		hSpeed=0
		if hurt 
			currentState=states.HURT
		if tiredTimer++ >= tiredDelay
			currentState=states.IDLE
		break
}

if oPlayer.currentState==states.ATTACK and distance_to_object(oPlayer) <= 50
	defending=1
else
	defending=0
	
if instance_exists(oBullet) 
	if distance_to_object(oBullet) <= 50{
		attacking=true
		theresABullet=true
	}
