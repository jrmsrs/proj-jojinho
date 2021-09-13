// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function keyInit(){
	keyLeft = keyboard_check_direct(ord("A")) or gamepad_axis_value(0,gp_axislh)<0
	keyRight = keyboard_check_direct(ord("D")) or gamepad_axis_value(0,gp_axislh)>0
	keyJumpPressed = keyboard_check_pressed(ord("W")) or gamepad_button_check_pressed(0,gp_face1)
	keyJumpReleased = keyboard_check_released(ord("W")) or gamepad_button_check_released(0,gp_face1)
}