beingAttacked = mouse_check_button_pressed(mb_left)
backwardsPlayer = (image_xscale<0 and sign(x-oPlayer.x)<0) or (image_xscale>0 and sign(x-oPlayer.x)>0)

event_inherited();

//modo ataque quando estiver proximo do player
if distance_to_object(oPlayer)<maxRange and !backwardsPlayer and !beingAttacked 
	hAxis=sign(oPlayer.x-x)
else
//modo patrulha
	hAxis=sign(image_xscale)
	
//se não houver um chão adiante ou se houver uma parede, inverta a direcao
if (!place_meeting(x+hSpeed*4,y+6,oWall) or place_meeting(x+hSpeed*4,y,oWall)) and onFloor{
	image_xscale = -image_xscale
	hAxis = image_xscale
}

if distance_to_object(oPlayer)<alertRange and !beingAttacked 
	hAxis=sign(oPlayer.x-x)

//tentar desviar se o player atacar de perto 
//(mouse_check para fim de debug enquanto oPlayer nao tem ataque)
if distance_to_object(oPlayer)<attackRange{
	if beingAttacked{
		jumpHeight/=1.3
		jumpPressTime = jumpPressTimeMax
	}else jumpHeight=jumpHeightOriginal
	if !place_meeting(x,y+6,oWall)
		do hAxis=-2*sign(oPlayer.x-x) 
		until distance_to_object(oPlayer)<attackRange
}
