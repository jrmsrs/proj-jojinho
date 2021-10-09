/// @description Description
other.hurt = choose(4,5,5,6,6,7)

if !other.invincible{
	other.hSpeed = choose(1,2,3,4)*sign(image_xscale)
	other.vSpeed = -4
}