if distance_to_point(oPlayer.x,oPlayer.y-30)>15 image_alpha=1

image_angle=dir

if bulletTimer++<1 {
	if oPlayer.image_xscale==oPlayer.defaultScale{
		if  (global.playerDir <= 360 and global.playerDir>=270) or (global.playerDir > 0 and global.playerDir<=90)
			dir = global.playerDir
		else dir = 0
	}else{ 
		//show_message("s")
		if !( (global.playerDir < 360 and global.playerDir>270) or (global.playerDir > 0 and global.playerDir<90) )
			dir = global.playerDir
		else dir = 180
	}
}

if variable_instance_exists(oCamera,"xCam")
	if  x <= camera_get_view_width(view_camera[0]) +oCamera.xCam
	and x > oCamera.xCam
	and y <= camera_get_view_height(view_camera[0])+oCamera.yCam
	and y > oCamera.yCam{
		x += lengthdir_x(20, dir)
		y += lengthdir_y(20, dir)
	}else
		instance_destroy()