if cursorTimer++<1 dir = global.playerDir

if variable_instance_exists(oCamera,"xCam")
	if  x <= camera_get_view_width(view_camera[0]) +oCamera.xCam
	and x > oCamera.xCam
	and y <= camera_get_view_height(view_camera[0])+oCamera.yCam
	and y > oCamera.yCam{
		x += lengthdir_x(14, dir)
		y += lengthdir_y(14, dir)
	}else
		instance_destroy()