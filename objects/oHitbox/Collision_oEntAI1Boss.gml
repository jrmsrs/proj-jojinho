//evento ativa somente se o hitbox for criado pelo player
if layer!=layer_get_id("PlayerBladeHitbox") exit

//enviar dano
switch(oPlayer.weapon1){
	case "Blade Wu":
		other.hurt = 5
		break
	case "Blade Draga":
		other.hurt = choose(2,8)
		break
}
	
if !other.invincible{
	other.hSpeed = choose(0,1,2,3,4)*sign(image_xscale)
}
