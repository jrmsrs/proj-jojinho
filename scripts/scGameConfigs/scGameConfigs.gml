function keyInit(kbDashL=false,kbDashR=false){
	keyLeft = keyboard_check_direct(ord("A")) or gamepad_axis_value(0,gp_axislh)<-.1
	keyRight = keyboard_check_direct(ord("D")) or gamepad_axis_value(0,gp_axislh)>.1
	
	keyLeftPressed = keyboard_check_pressed(ord("A"))
	keyRightPressed = keyboard_check_pressed(ord("D"))
	
	keyUp = keyboard_check_direct(ord("W")) or gamepad_axis_value(0,gp_axislv)<-.1
	keyDown = keyboard_check_direct(ord("S")) or gamepad_axis_value(0,gp_axislv)>.1
	
	keyJumpPressed = keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0,gp_face1)
	keyJumpHold = keyboard_check(vk_space) or gamepad_button_check(0,gp_face1)
	keyJumpReleased = keyboard_check_released(vk_space) or gamepad_button_check_released(0,gp_face1)
	
	keyDash = (keyLeft and kbDashL) or (keyRight and kbDashR) or gamepad_button_check_pressed(0,gp_face2)
	keyWeapon1 = mouse_check_button_pressed(mb_left) or gamepad_button_check_pressed(0,gp_face3)
	keyWeapon2 = mouse_check_button_pressed(mb_right) or gamepad_button_check_pressed(0,gp_face4)
	
	//key invert weapon1/weapon2
	keyInvert = keyboard_check_pressed(vk_tab) or gamepad_button_check(0,gp_shoulderr)
	keyWeaponAux=keyWeapon1
	if instance_exists(oPlayer) 
		if global.invertWeapon{ 
			keyWeapon1=keyWeapon2
			keyWeapon2=keyWeaponAux
		}
	
	keyLeftSec = keyboard_check_direct(vk_left) or gamepad_axis_value(0,gp_axisrh)<-.1
	keyRightSec = keyboard_check_direct(vk_right) or gamepad_axis_value(0,gp_axisrh)>.1
	keyUpSec = keyboard_check_direct(vk_up) or gamepad_axis_value(0,gp_axisrv)<-.1
	keyDownSec = keyboard_check_direct(vk_down) or gamepad_axis_value(0,gp_axisrv)>.1
	
	keySetW1=mouse_wheel_up() or gamepad_button_check_pressed(0,gp_padu)
	keySetW2=mouse_wheel_down() or gamepad_button_check_pressed(0,gp_padd)
	
	keyLockCursor=keyboard_check_pressed(ord("Q")) or gamepad_button_check_pressed(0,gp_stickr)
	keyUnlockCursor=keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(0,gp_stickl)
	
	gpAxisRValues = [
		gamepad_axis_value(0,gp_axisrh)<-0.01,
		gamepad_axis_value(0,gp_axisrh)> 0.01,
		gamepad_axis_value(0,gp_axisrv)<-0.01,
		gamepad_axis_value(0,gp_axisrv)> 0.01
	]
	gpAxisRNull = !(gpAxisRValues[0]+gpAxisRValues[1]+gpAxisRValues[2]+gpAxisRValues[3])
	
	keyPause = keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(0,gp_start)
	keyQuit = keyboard_check_pressed(ord("K"))
	
	keyDebug = keyboard_check_pressed(vk_f1)
	keyRestart = keyboard_check_pressed(ord("R")) //debug
	
	anyKeyPressed = keyLeft or keyRight or keyJumpPressed or keyDash or keyWeapon1 or keyWeapon2
}

function globalVarsInit(){
	global.debug=false
	//Initialize inventory
	global.inventoryWeapon1 = ds_list_create()
	global.inventoryWeapon2 = ds_list_create()
	global.inventoryEquip = ds_list_create()
	
	global.progress = ds_map_create()
	//area A
	global.progress[? "Area A done"]    = false
	global.progress[? "Area A active1"] = false
	//global.progress[? "Area A secretboss"] = false
	
	//area B
	global.progress[? "Area B done"] = false
	global.progress[? "Area B active1"] = false //a caixa vai ficar no lugar quando for para o boss
	global.progress[? "Area B boss"] = false


	//Store room types
	global.roomTypeStage = ds_list_create()
	global.roomTypeUI = ds_list_create()
	
	global.totItemTypes = 0

	global.previRoom = noone
	
	global.transitionState=0 //0=no transition, 1=ready, 2=fadein, 3=fadeout
}
