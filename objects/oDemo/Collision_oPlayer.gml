if !other.invincible{
	alert=0
	other.hurt = choose(4,5,5,6,6,7)
	other.hSpeed = choose(1,2,3,4)*sign(image_xscale)
	vSpeed=-movSpeed
}
