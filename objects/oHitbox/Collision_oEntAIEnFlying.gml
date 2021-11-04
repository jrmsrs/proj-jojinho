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
	other.hSpeed = lengthdir_x(4, point_direction(oPlayer.x,oPlayer.y-20,oDemo.x,oDemo.y-20))
	other.vSpeed = lengthdir_y(4, point_direction(oPlayer.x,oPlayer.y-20,oDemo.x,oDemo.y-20))
}
