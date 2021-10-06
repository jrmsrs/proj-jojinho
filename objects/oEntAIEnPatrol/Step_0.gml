event_inherited();

function chase(){
	if distance_to_object(oPlayer) <= 20
		hAxis = sign(oPlayer.x-x)
		
	if place_meeting(x+(distanceSensor*sign(image_xscale)),y,oPlayer)
		return true
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
			hAxis=sign(image_xscale)
		}
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
		if (!place_meeting(x+sign(image_xscale)*16,y+6,oWall) or place_meeting(x+sign(image_xscale)*16,y,oWall)) and onFloor{
			image_xscale = -image_xscale
			hAxis = image_xscale
		}
		if chase() iaTimer=0
		break
}

iaTimer++

