//if !lockCursor{
	if cursorTimer++<1 
		dir = global.playerDir
//}else{
	//show_debug_message("Cursor bloqueado em "+ string(global.lockTarget))
//	show_debug_message(point_direction(oPlayer.x,oPlayer.y,global.lockTarget.x,global.lockTarget.y))
//	global.playerDir = point_direction(oPlayer.x,oPlayer.y,global.lockTarget.x,global.lockTarget.y)
//	dir = global.playerDir
//}

if variable_instance_exists(oCamera,"xCam")
	if  x <= camera_get_view_width(view_camera[0]) +oCamera.xCam
	and x > oCamera.xCam
	and y <= camera_get_view_height(view_camera[0])+oCamera.yCam
	and y > oCamera.yCam{
		x += lengthdir_x(30, dir)
		y += lengthdir_y(30, dir)
	}else
		instance_destroy()
		
oGame.actualDir=dir

for (i=0; i<ds_list_size(global.selectedCreatures); i++){
	if !ds_list_find_value(global.selectedCreatures,i).selected 
		ds_list_delete(global.selectedCreatures,i)
}

//show_debug_message(ds_list_size(global.selectedCreatures))