keyInit()
hAxis = round(keyRight-keyLeft)
if keyAttack && weapon1!="none" attacking=1
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

if keyboard_check_pressed(ord("N")){
	weapon1="Blade Wu"
	show_message("Wu")
}
if keyboard_check_pressed(ord("M")){
	weapon1="Blade Draga"
	show_message("Draga")
}
if !gpAxisRNull{
	cursor = instance_create_layer(x,y-17,"Creatures",oGamePadCursor)
	global.playerDir = point_direction(0,0, gamepad_axis_value(0,gp_axisrh), gamepad_axis_value(0,gp_axisrv));
}else
	cursorMoved=false