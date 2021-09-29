//evento ativa somente se o hitbox for criado pelo player
if layer==!layer_get_id("PlayerBladeHitbox") exit

//enviar dano
if place_meeting(x,y,other) 
	switch(oPlayer.weapon1){
		case "Blade Wu":
			other.hurt = 5
			break
	}
