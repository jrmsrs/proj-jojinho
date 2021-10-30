image_alpha=1

if cursorTimer++<1 
	dir = global.playerDir


if variable_instance_exists(oCamera,"xCam")
	if  x <= camera_get_view_width(view_camera[0]) +oCamera.xCam + 300
	and x > oCamera.xCam - 300
	and y <= camera_get_view_height(view_camera[0])+oCamera.yCam
	and y > oCamera.yCam{
		x += lengthdir_x(30, dir)
		y += lengthdir_y(30, dir)
	}else
		instance_destroy()

for (i=0; i<ds_list_size(global.selectedCreatures); i++){
	if !ds_list_find_value(global.selectedCreatures,i).selected 
		ds_list_delete(global.selectedCreatures,i)
}
