frames=0
dir=sign(x-oPlayer.x)

if layer==layer_get_id("PlayerBladeHitbox"){
	image_xscale = .25*dir
	image_yscale = .45
}