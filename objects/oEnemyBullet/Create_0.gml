audio_play_sound(sfPlayerGunLauncher,1,false)

image_xscale=.3
image_yscale=image_xscale
image_alpha=0

bulletTimer=0
dir = global.playerDir

owner = oSniper
dir = point_direction(x,y,oPlayer.x,oPlayer.y-6*oPlayer.image_yscale)
image_alpha=1