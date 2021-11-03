if !global.debug image_alpha = 0

frames=0

if layer==layer_get_id("PlayerBladeHitbox"){
	//audio_play_sound(sndBladeSlashMiss,1,0)
	dir=sign(x-oPlayer.x)
	image_xscale = .25*dir
	image_yscale = .45
	exit
}

if layer==layer_get_id("EnemyHitbox"){
	dir=sign(x-instance_nearest(x,y,oEntAIEnPatrol).x)
	image_xscale = .25*dir
	image_yscale = .45
	exit
}

if layer==layer_get_id("BossHitbox"){
	image_xscale = 1.35
	image_yscale = 1
}
