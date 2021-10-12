image_xscale=.1
image_yscale=image_xscale

keyInit()

if !mouse_check_button_released(mb_middle) 
	global.playerDir = point_direction(oPlayer.x,oPlayer.y,mouse_x,mouse_y)
if !gpAxisRNull and !oPlayer.cursorMoved{
	oPlayer.cursorMoved=true
}

cursorTimer=0