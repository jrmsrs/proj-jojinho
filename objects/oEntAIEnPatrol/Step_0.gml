event_inherited();

if !object_exists(oPlayer) exit


playerInvincible = oPlayer.currentState==states.FAINT or oPlayer.currentState==states.HURTFALL or oPlayer.currentState==states.HURTFALLBACK

function chase(){
	if distance_to_object(oPlayer) <= 38 and distance_to_object(oPlayer) > 15{
		if playerInvincible return false
		hAxis = sign(oPlayer.x-x) 
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
		hAxis=0
		if iaTimer >= 300 or chase(){
			iaTimer=0
			currentState = states.RUN
			if !playerInvincible hAxis=sign(image_xscale)
			else hAxis=-sign(image_xscale)
		}
		if distance_to_object(oPlayer) <= 14 and sign(oPlayer.x-x)==sign(image_xscale) and !playerInvincible{
			hAxis=0
			attacking=1
		}
		//show_debug_message(sign(oPlayer.x-x))
		break
		
	case states.RUN:
		if iaTimer >= 500{
			iaTimer=0
			currentState = states.IDLE
			hAxis=0
			break
		}
		//modo patrulha
		hAxis=sign(image_xscale)
	
		//se não houver um chão adiante ou se houver uma parede, inverta a direcao
		if (!place_meeting(x+sign(image_xscale)*16,y+6,oWall) or place_meeting(x+sign(image_xscale)*4,y,oWall)) and onFloor{
			image_xscale = -image_xscale
			hAxis = image_xscale
		}
		
		if chase() iaTimer=0 //
		
		if distance_to_object(oPlayer)<=14 and !playerInvincible {
			hAxis=0
			currentState = states.IDLE
		}
		
		break
		
	case states.ATTACK:
		if image_index >= 2 {
			if sprite_index != sAttack[0] and image_index == 2{  //combos acertam por tras
				instance_create_layer(x+16*sign(image_xscale),y-30,"EnemyHitbox",oHitbox)
				instance_create_layer(x+5*-sign(image_xscale),y-30,"EnemyHitbox",oHitbox)
			}else if image_index == 3
				instance_create_layer(x+16*sign(image_xscale),y-30,"EnemyHitbox",oHitbox)
		}
		break
		
	case states.RUNTTACK:
		currentState=states.ATTACK
		break
}

iaTimer++