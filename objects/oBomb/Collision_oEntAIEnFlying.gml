if !exploding exit

other.hurt = choose(5,6)
	
if !other.invincible{
	other.hSpeed = 6*sign(x-other.x)
	other.vSpeed = 6*sign(y-other.y)
}
