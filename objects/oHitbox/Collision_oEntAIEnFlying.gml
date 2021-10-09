/// @description Description
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
	
//if !other.invincible{
	other.hSpeed = choose(1,2,3,4,5,6)*sign(x-oPlayer.x)
	other.vSpeed = choose(1,2,3,4,5,6)*sign(y-oPlayer.y)
//}
