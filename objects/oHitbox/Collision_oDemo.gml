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
	oDemo.hSpeed = 2*sign(x-oPlayer.x)
	oDemo.vSpeed = 2*sign(y-oPlayer.y)
}