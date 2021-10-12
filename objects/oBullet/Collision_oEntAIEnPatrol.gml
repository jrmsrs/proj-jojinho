//enviar dano
switch(oPlayer.weapon2){
	case "Gun Revla":
		other.hurt = choose(2,2,3,4)
		break
}
	
if !other.invincible{
	oDemo.hSpeed = 2*sign(x-oPlayer.x)
	oDemo.vSpeed = 2*sign(y-oPlayer.y)
}
