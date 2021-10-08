//evento ativa somente se o hitbox for criado pelo player
if layer!=layer_get_id("EnemyHitbox") exit

//if place_meeting(x,y,other) 
	other.hurt = 5

if !other.invincible{
	other.hSpeed = choose(1,2,3,4)*sign(image_xscale)
	other.vSpeed = -4
}
