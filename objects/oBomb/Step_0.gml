if distance_to_point(oPlayer.x,oPlayer.y-30)>40 image_alpha=1

if exploding{
	image_xscale+=.1
	image_yscale+=.1
	shakeScreen(10)
}

if !active 
	image_index=0
if image_index>=5 
	exploding=true
if image_index>=image_number-1 
	instance_destroy()

image_angle=dir

if bulletTimer++<1 {
	if oPlayer.image_xscale==oPlayer.defaultScale{
		if  (global.playerDir <= 360 and global.playerDir>=270) or (global.playerDir > 0 and global.playerDir<=90)
			dir = global.playerDir
		else dir = 0
	}else{ 
		if !( (global.playerDir < 360 and global.playerDir>270) or (global.playerDir > 0 and global.playerDir<90) )
			dir = global.playerDir
		else dir = 180
	}
}

if variable_instance_exists(oCamera,"xCam")
	if  x <= camera_get_view_width(view_camera[0]) +oCamera.xCam + 300
	and x > oCamera.xCam - 300
	and y <= camera_get_view_height(view_camera[0])+oCamera.yCam + 100
	and y > oCamera.yCam - 100{
		if !active{
			x += lengthdir_x(4, dir)
			y += lengthdir_y(4, dir)
		}else{
			x += lengthdir_x(.2, dir)
			y += lengthdir_y(.2, dir)
		}
	}else if bulletTimer>=35 instance_destroy()
