frames=0

if layer==layer_get_id("PlayerBladeHitbox"){
	dir=sign(x-oPlayer.x)
	image_xscale = .25*dir
	image_yscale = .45
}

if layer==layer_get_id("EnemyHitbox"){
	dir=sign(x-instance_nearest(x,y,oEntAIEnPatrol).x /*oEntAIEnPatrol.x*/)
	image_xscale = .25*dir
	image_yscale = .45
}