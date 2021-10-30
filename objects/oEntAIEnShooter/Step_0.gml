event_inherited();

if !object_exists(oPlayer) exit

switch(currentState){
	case states.IDLE:
		//if sprite_index!=sIdle and sprite_index!=sHurt
			//alert=false
		hAxis=0
		if iaTimer++ >= iaDelay or chase(){// or chase() or alert{
			iaTimer=0
			iaDelay=choose(100,200,300,400)
			currentState = states.RUN
			if !oPlayer.invincible hAxis=sign(image_xscale)
			else hAxis=-sign(image_xscale)
		}
		if distance_to_object(oPlayer) <= shootRange and sign(oPlayer.x-x)==sign(image_xscale) and !oPlayer.invincible{
			hAxis=0
			shooting=1
		}
		break
		
	case states.RUN:
		if iaTimer++ >= iaDelay{//500{
			iaTimer=0
			currentState = states.IDLE
			hAxis=0
			break
		}
		
		hAxis=sign(image_xscale)
	
		//se não houver um chão adiante ou se houver uma parede, inverta a direcao
		if (!place_meeting(x+sign(image_xscale)*16,y+6,oWall) or place_meeting(x+sign(image_xscale)*4,y,oWall)) and onFloor{
			hAxis = -hAxis
		}
		
		if chase()
			iaTimer=0
		
		if distance_to_object(oPlayer)<=shootRange and !oPlayer.invincible and sign(oPlayer.x-x)==sign(image_xscale){
			hAxis=0
			currentState = states.IDLE
		}
		
		break
		
	case states.SHOOTTACK:
		if sign(x-oPlayer.x)==sign(image_xscale) currentState=states.IDLE
		if image_index==image_number-2{
			var bull=instance_create_layer(x,y-19*defaultScale,"Game",oEnemyBullet)
			bull.owner = object_index 
		}
		break
}
