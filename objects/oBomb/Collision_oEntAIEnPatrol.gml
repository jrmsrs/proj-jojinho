if !exploding exit

other.hurt = choose(5,6)

if !other.invincible{
	other.hSpeed = choose(4,5)*sign(other.x-oPlayer.x)
	other.vSpeed = -6
}
