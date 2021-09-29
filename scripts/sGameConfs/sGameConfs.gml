function keyInit(){
	keyLeft = keyboard_check_direct(ord("A")) or gamepad_axis_value(0,gp_axislh)<0
	keyRight = keyboard_check_direct(ord("D")) or gamepad_axis_value(0,gp_axislh)>0
	keyJumpPressed = keyboard_check_pressed(ord("W")) or gamepad_button_check_pressed(0,gp_face1)
	keyJumpHold = keyboard_check(ord("W")) or gamepad_button_check(0,gp_face1)
	keyJumpReleased = keyboard_check_released(ord("W")) or gamepad_button_check_released(0,gp_face1)
	keyDash = keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0,gp_face2)
	keyAttack = mouse_check_button_pressed(mb_left) or gamepad_button_check_pressed(0,gp_face3)
	keyQuit = keyboard_check_pressed(ord("K"))
}

function parallaxSetup(parallax){
	if parallax==0 exit
	
	//Parallax nuvem
	layer_x(layer_get_id("Parallax1"), newX * 0.95 +(i1--/10)) //move-se sozinho lentamente (-1px/10) à esquerda
	layer_y(layer_get_id("Parallax1"), newY * 0.5)
	if parallax==1 exit
	
	//Parallax montanha
	layer_x(layer_get_id("Parallax2"), newX * 0.85)
	layer_y(layer_get_id("Parallax2"), newY * 0.4)
	if parallax==2 exit
	
	//Parallax ....
	layer_x(layer_get_id("Parallax3"), newX * 0.65)
	layer_y(layer_get_id("Parallax3"), newY * 0.65)
	if parallax==3 exit
	
	//Paralax ....
	layer_x(layer_get_id("Parallax4"), newX * 0.35)
	layer_y(layer_get_id("Parallax4"), newY * 0.35)
}

function roomDefine(){
	switch(room){
		case rStage1: parallaxSetup(2); break
		default: parallaxSetup(0)
	}
}