//evento ativa somente se o hitbox for criado pelo player
if layer!=layer_get_id("EnemyHitbox") exit

if place_meeting(x,y,other) 
	other.hurt = 5
