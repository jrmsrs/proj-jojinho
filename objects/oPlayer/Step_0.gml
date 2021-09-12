//Calculate input horizontal
//hAxis = (keyboard_check_direct(ord("D"))-keyboard_check_direct(ord("A")))
//gp_

keyLeft = keyboard_check_direct(ord("A")) or gamepad_axis_value(0,gp_axislh)<0
keyRight = keyboard_check_direct(ord("D")) or gamepad_axis_value(0,gp_axislh)>0
keyJumpPressed = keyboard_check_pressed(ord("W")) or gamepad_button_check_pressed(0,gp_face1)
keyJumpReleased = keyboard_check_released(ord("W")) or gamepad_button_check_released(0,gp_face1)

hAxis = round(keyRight-keyLeft)

event_inherited();

if keyJumpPressed
    jumpPressTime=jumpPressTimeMax
	
//Pulo minimo quando pressiona e solta antes de subir
if jumping and keyJumpReleased vSpeed = vSpeed/5

if hAxis!=0 
	if running sprite_index = sRun
	else sprite_index = sIdle
else sprite_index = sIdle

//Walljump
if place_meeting(x+6,y,oWall) or place_meeting(x-6,y,oWall) {
    if jumpPressTime>0 and !onFloor {
        vSpeed=-jumpHeight   
        if place_meeting(x-6,y,oWall) hSpeed=walljumpForce
        else hSpeed=-walljumpForce
        jumpPressTime=0
    }
}



if jumping or falling sprite_index=sJump
 