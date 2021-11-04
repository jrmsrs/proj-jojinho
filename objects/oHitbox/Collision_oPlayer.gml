if layer!=layer_get_id("EnemyHitbox") and layer!=layer_get_id("BossHitbox") exit

other.hurt = choose(2,3,4,5,6)

if !other.invincible{
	other.hSpeed = choose(1,2,3,4)*sign(image_xscale)
	other.vSpeed = -4
}

if layer==layer_get_id("BossHitbox"){
	other.hurt = choose(1,2,3,3,3,4,5)

	if !other.invincible{
		other.hSpeed = choose(3,4,5)*sign(oPlayer.x-oBoss.x)
		other.vSpeed = -5
	}
}