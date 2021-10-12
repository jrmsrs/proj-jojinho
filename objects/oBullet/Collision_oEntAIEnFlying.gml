//enviar dano
switch(oPlayer.weapon2){
	case "Gun Revla":
		other.hurt = choose(2,2,3,4)
		break
}
	
if !other.invincible{
	other.hSpeed = choose(0,1,2,3,4)*sign(image_xscale)
	other.vSpeed = -4
}
