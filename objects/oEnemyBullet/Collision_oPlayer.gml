//enviar dano
switch(owner){
	case oSniper:
		other.hurt = choose(2,3)
		break
	default:
		other.hurt = 1
		break
}
	
if !other.invincible{
	other.hSpeed = choose(0,1,2,3)*sign(other.x-owner.x)
	other.vSpeed = -4
}

if other.currentState!=4 instance_destroy()
