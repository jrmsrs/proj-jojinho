//Calculate input horizontal
hAxis = (keyboard_check_direct(ord("D")) - keyboard_check_direct(ord("A")))

if keyboard_check_pressed(ord("W")) {
    jumpPressTime = jumpPressTimeMax
}

if hAxis!=0{
	image_xscale = hAxis*2
	if hSpeed!=0 sprite_index = sRun else sprite_index = sIdle
}else sprite_index = sIdle

//Walljump
if place_meeting(x+6,y,oWall) or place_meeting(x-6,y,oWall) {
    if jumpPressTime > 0 and !place_meeting(x,y+6,oWall) {
        vSpeed = -jumpHeight   
        if place_meeting(x-6,y,oWall) {
            hSpeed = walljumpForce
        } else {
            hSpeed = -walljumpForce
        }
        jumpPressTime = 0
    }
}

event_inherited();

if vSpeed!=0 or (vSpeed==0 and !place_meeting(x,y+3,oWall)) sprite_index=sJump