//Calculate input horizontal
h_axis = (keyboard_check_direct(ord("D")) - keyboard_check_direct(ord("A")))
if h_axis!=0{
	image_xscale = h_axis*2
	if h_speed!=0 sprite_index = sRun else sprite_index = sIdle
}else sprite_index = sIdle

//Accel/Decel on ground
if place_meeting(x,y+6,oWall) or place_meeting(x,y+(sprite_height),oGround) {
    if h_axis != 0 {
        h_speed = lerp(h_speed,h_axis * mov_speed,accel)
    } else {
        h_speed = lerp(h_speed,0,decel)
    }
} else { //Accel/Decel in air
    if h_axis != 0 {
        h_speed = lerp(h_speed,h_axis * mov_speed,accel_air)
    } else {
        h_speed = lerp(h_speed,0,decel_air)
    }
}

//Jump
if jump_press_time > 0 {
    jump_press_time--
}

if ground_time > 0 {
    ground_time--
}

if keyboard_check_pressed(ord("W")) {
    jump_press_time = jump_press_time_max
}



if place_meeting(x,y+6,oWall) or place_meeting(x,y+6,oGround){
    ground_time = ground_time_max
}

if jump_press_time > 0 and ground_time > 0 {
    v_speed = -jump_height
    jump_press_time = 0
    ground_time = 0
}

if v_speed < 0 and keyboard_check_released(ord("W")) {
    v_speed = v_speed/2
}

//Gravity
v_speed += gravity_force

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

//Collision left/right and apply force
if place_meeting(x+h_speed,y,oWall) {
    while(!place_meeting(x+sign(h_speed),y,oWall)) {
        x+=sign(h_speed)
    }
    h_speed = 0
}
x+=h_speed

//Collision top/down and apply force
if place_meeting(x,y+v_speed,oWall) {
    while(!place_meeting(x,y+sign(v_speed),oWall)) {
        y+=sign(v_speed)
    }
    v_speed = 0
}
//limit max falling speed
if v_speed>=12 v_speed=12
y+=v_speed 

//Reset after outside screen
if x < 0 or x > room_width or y > room_height {
	v_speed = 0
	h_speed = 0
    x = xstart
    y = ystart
}

if v_speed!=0 or (v_speed==0 and !place_meeting(x,y+3,oWall)) sprite_index=sJump