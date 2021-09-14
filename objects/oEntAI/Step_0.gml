event_inherited();

//modo patrulha
hAxis=sign(image_xscale)
	
//se não houver um chão adiante ou se houver uma parede, inverta a direcao
if (!place_meeting(x+hSpeed*4,y+6,oWall) or place_meeting(x+hSpeed*4,y,oWall)) and onFloor{
	image_xscale = -image_xscale
	hAxis = image_xscale
}
