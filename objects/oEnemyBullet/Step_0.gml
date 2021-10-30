image_angle=dir
image_index=1
if variable_instance_exists(oCamera,"xCam")
	if  x <= camera_get_view_width(view_camera[0]) +oCamera.xCam + 300
	and x > oCamera.xCam - 300
	and y <= camera_get_view_height(view_camera[0])+oCamera.yCam + 100
	and y > oCamera.yCam - 100{
		x += lengthdir_x(15, dir)
		y += lengthdir_y(15, dir)
	}else if bulletTimer>=35 instance_destroy()
