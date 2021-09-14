beingAttacked = oPlayer.attacking and oPlayer.image_index<2 and distance_to_object(oPlayer)<attackRange
backwardsPlayer = (image_xscale<0 and sign(x-oPlayer.x)<0) or (image_xscale>0 and sign(x-oPlayer.x)>0)
playerBackwards = (oPlayer.image_xscale<0 and sign(oPlayer.x-x)<0) or (oPlayer.image_xscale>0 and sign(oPlayer.x-x)>0)

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

if distance_to_object(oPlayer)<alertRange and !beingAttacked and playerBackwards
	if !playerBackwards hAxis=sign(oPlayer.x-x)

//tentar desviar se o player atacar de perto 
//(mouse_check para fim de debug enquanto oPlayer nao tem ataque)
if distance_to_object(oPlayer)<attackRange and !playerBackwards{
	if beingAttacked{
		jumpHeight/=1.3
		jumpPressTime = jumpPressTimeMax
		attacking=0
	}else jumpHeight=jumpHeightOriginal
	if !place_meeting(x,y+6,oWall)  
		do hAxis=-2*sign(oPlayer.x-x) 
		until distance_to_object(oPlayer)<attackRange
}

//se voltar para o player quando desviando
if beingAttacked and !playerBackwards { 
	hAxis=-2*sign(oPlayer.x-x) 
	image_xscale=-hAxis
}

if (place_meeting(x+35,y,oPlayer) or place_meeting(x-35,y,oPlayer)) {
	attacking=1
}