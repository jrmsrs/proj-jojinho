//enviar dano
switch(oPlayer.weapon2){
	case "Gun Revla":
		other.hurt = choose(2,3)
		break
}
	
if !other.invincible{
	other.hSpeed = choose(1,2,3)*sign(other.x-oPlayer.x)
}

instance_destroy()
