//Calculate input horizontal
h_axis = (keyboard_check_direct(ord("D")) - keyboard_check_direct(ord("A")))

if keyboard_check_pressed(ord("W")) {
    jump_press_time = jump_press_time_max
}

if h_axis!=0{
	image_xscale = h_axis*2
	if h_speed!=0 sprite_index = sRun else sprite_index = sIdle
}else sprite_index = sIdle

//Walljump
if place_meeting(x+6,y,oWall) or place_meeting(x-6,y,oWall) {
    if jump_press_time > 0 and !place_meeting(x,y+6,oWall) {
        v_speed = -jump_height   
        if place_meeting(x-6,y,oWall) {
            h_speed = walljump_force
        } else {
            h_speed = -walljump_force
        }
        jump_press_time = 0
    }
}

event_inherited();

if v_speed!=0 or (v_speed==0 and !place_meeting(x,y+3,oWall)) sprite_index=sJump