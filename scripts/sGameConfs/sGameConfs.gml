function keyInit(){
	keyLeft = keyboard_check_direct(ord("A")) or gamepad_axis_value(0,gp_axislh)<0
	keyRight = keyboard_check_direct(ord("D")) or gamepad_axis_value(0,gp_axislh)>0
	
	keyJumpPressed = keyboard_check_pressed(ord("W")) or gamepad_button_check_pressed(0,gp_face1)
	keyJumpHold = keyboard_check(ord("W")) or gamepad_button_check(0,gp_face1)
	keyJumpReleased = keyboard_check_released(ord("W")) or gamepad_button_check_released(0,gp_face1)
	keyDash = keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0,gp_face2)
	keyAttack = mouse_check_button_pressed(mb_left) or gamepad_button_check_pressed(0,gp_face3)
	keyShoot = mouse_check_button_pressed(mb_right) or gamepad_button_check_pressed(0,gp_face4)
	keyQuit = keyboard_check_pressed(ord("K"))
	
	keyLeftSec = keyboard_check_direct(vk_left) or gamepad_axis_value(0,gp_axisrh)<-0.01
	keyRightSec = keyboard_check_direct(vk_right) or gamepad_axis_value(0,gp_axisrh)>0.01
	keyUpSec = keyboard_check_direct(vk_up) or gamepad_axis_value(0,gp_axisrv)<-0.01
	keyDownSec = keyboard_check_direct(vk_down) or gamepad_axis_value(0,gp_axisrv)>0.01
	
	keySetW1=mouse_wheel_up() or gamepad_button_check_pressed(0,gp_padu)
	keySetW2=mouse_wheel_down() or gamepad_button_check_pressed(0,gp_padd)
	
	keyLockCursor=gamepad_button_check_pressed(0,gp_stickr)
	keyUnlockCursor=gamepad_button_check_pressed(0,gp_stickl)
	
	
	gpAxisRNull = (!keyLeftSec and !keyRightSec and !keyUpSec and !keyDownSec)
	
	anyKeyPressed = keyLeft or keyRight or keyJumpPressed or keyDash or keyAttack
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
	
function drawInventory(n, quantityItems, yPos=70, scale=4, balloonStretchW=0, balloonStretchH=0, itemFrameSize=0, sel=[oPlayer.weapon1,oPlayer.weapon2]){
	balloonStretchW=12*scale
	balloonStretchH=26*scale
	itemFrameSize=9*scale
	
	//draw balloon arrow
	draw_sprite_ext(sInventory,2,x,y-yPos,2,2,0,c_white,1)
	//draw balloon stretchable width (varia com a quantidade de TIPOS de itens selecionaveis (n) )
	draw_sprite_stretched(sInventory,1,x-(balloonStretchW/2)*n,y-yPos-balloonStretchH,balloonStretchW*n,balloonStretchH)
	//draw balloon lateral borders
	draw_sprite_ext(sInventory,0,x-(balloonStretchW/2)*n,y-yPos-balloonStretchH,scale,scale,0,c_white,1)
	draw_sprite_ext(sInventory,0,x+(balloonStretchW/2)*n,y-yPos-balloonStretchH,scale,scale,0,c_white,1)
	//draw scroll bg and scroll
	for (i=0;i<n;i++){
		draw_sprite_ext(sInventory,3,x-(balloonStretchW/2)*n+(balloonStretchW*i),y-yPos-balloonStretchH,scale,scale,0,c_white,1)
		for (j=0;j<quantityItems[i];j++){
			draw_sprite_ext(sInventory, 5, x-(balloonStretchW/2)*n+(balloonStretchW*i), y-yPos-balloonStretchH+itemFrameSize*j, scale,scale,0,$E9E9E9,1)
			
		}
	}
	
	for (i=0;i<n;i++){
		for (j=0;j<quantityItems[i];j++){
			if i==0 
				switch ds_list_find_value(global.inventoryWeapon1,j){
					case "Blade Wu":
						if sel[i]="Blade Wu" draw_sprite_ext(sISelect, 0, x-(balloonStretchW/2)*n+(balloonStretchW*i), y-yPos-balloonStretchH+itemFrameSize*j, scale/4,scale/4,0,c_white,1)
						draw_sprite_ext(sIAllBlades, 0, x-(balloonStretchW/2)*n+(balloonStretchW*i), y-yPos-balloonStretchH+itemFrameSize*j, scale/4,scale/4,0,c_white,1)
						break
					case "Blade Draga":
						if sel[i]="Blade Draga" draw_sprite_ext(sISelect, 0, x-(balloonStretchW/2)*n+(balloonStretchW*i), y-yPos-balloonStretchH+itemFrameSize*j, scale/4,scale/4,0,c_white,1)
						draw_sprite_ext(sIAllBlades, 1, x-(balloonStretchW/2)*n+(balloonStretchW*i), y-yPos-balloonStretchH+itemFrameSize*j, scale/4,scale/4,0,c_white,1)
						break
				}
			if i==1
				switch ds_list_find_value(global.inventoryWeapon2,j){
					case "Gun Revla":
						if sel[i]="Gun Revla" draw_sprite_ext(sISelect, 0, x-(balloonStretchW/2)*n+(balloonStretchW*i), y-yPos-balloonStretchH+itemFrameSize*j, scale/4,scale/4,0,c_white,1)
						draw_sprite_ext(sIAllGuns, 0, x-(balloonStretchW/2)*n+(balloonStretchW*i), y-yPos-balloonStretchH+itemFrameSize*j, scale/4,scale/4,0,c_white,1)
						break
				}
			if i==2
				switch ds_list_find_value(global.inventoryEquip,j){
					default: break
				}
		}
	}
}
