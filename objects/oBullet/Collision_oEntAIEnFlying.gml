//enviar dano
switch(oPlayer.weapon2){
	case "Gun Revla":
		other.hurt = choose(2,3)
		break
}
	
if !other.invincible{
	other.hSpeed = 2*sign(x-other.x)
	other.vSpeed = 2*sign(y-other.y)
}

instance_destroy()
