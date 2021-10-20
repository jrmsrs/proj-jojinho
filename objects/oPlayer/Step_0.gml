keyInit()

//Congelar rapidamente o player no inicio das rooms
if roomStartLag-- <= 0 {
	roomStartLag=0
	//Movimentacao
	hAxis = round(keyRight-keyLeft)
}else{
	//Congelar a sprite 
	image_index=image_number-1
	hSpeed=0
	hAxis=0
}
if keyInvert
	global.invertWeapon=!global.invertWeapon
if keyWeapon1 
	attacking=1
if keyWeapon2
	shooting=1
if keyDash and dashLimiter{
	dashing=1
	dashLimiter=0
}

event_inherited();

//Opções individuais do oPlayer
if keyJumpPressed jumpPressTime=jumpPressTimeMax
if jumpPressTime>0 and !keyJumpHold jumpPressTime--
//Pulo medio
if jumping and keyJumpReleased vSpeed = vSpeed/2

//recupera possibilidade de dash quando esta no chao ou quando faz walljump
if onFloor or (place_meeting(x+6,y,oWall) and keyJumpPressed) dashLimiter = 1



if !gpAxisRNull{
	cursor = instance_create_layer(x,y-17,"Game",oGamePadCursor)
	if !lockCursor
		global.playerDir = point_direction(0,0, gamepad_axis_value(0,gp_axisrh), gamepad_axis_value(0,gp_axisrv));
	initialPlayerDir = 0
}else if mouse_check_button(mb_middle){
	cursor = instance_create_layer(x,y-17,"Game",oGamePadCursor)
	if !lockCursor
		global.playerDir = point_direction(oPlayer.x,oPlayer.y-16, mouse_x, mouse_y);
	initialPlayerDir = 0
}else
	cursorMoved=false
if lockCursor 
	global.playerDir = point_direction(oPlayer.x,oPlayer.y,global.lockTarget.x,global.lockTarget.y)


if initialPlayerDir
	if image_xscale>0 global.playerDir=0
	else global.playerDir=180

if keyLockCursor and instance_exists(global.lockTarget)
	lockCursor = true
	
if distance_to_object(global.lockTarget)>520 
	lockCursor = false
	
if keyUnlockCursor
	lockCursor = false

if ds_list_size(global.selectedCreatures)>0
	global.lockTarget=ds_list_find_value(global.selectedCreatures,ds_list_size(global.selectedCreatures)-1)
