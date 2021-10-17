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
	other.hSpeed = 2*sign(image_xscale)
	other.vSpeed = 2*sign(image_xscale)
}
