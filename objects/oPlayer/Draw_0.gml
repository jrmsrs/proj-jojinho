//melee attack
firstAttack = sprite_index == sAttack[0] or sprite_index == sAirttack or sprite_index == sRunttack

switch weapon1 {
	case "Blade Wu":
		weapon1Sprite1 = sIBladeWuAtk1
		weapon1Sprite2 = sIBladeWuAtk2
		weapon1Sprite3 = sIBladeWuAtk3
		break
	case "Blade Draga":
		weapon1Sprite1 = sIBladeDragaAtk1
		weapon1Sprite2 = sIBladeDragaAtk2
		weapon1Sprite3 = sIBladeDragaAtk3
		break
}

if sprite_index == sAttack[0] or sprite_index == sRunttack
	draw_sprite_ext(weapon1Sprite1,image_index,x,y,sign(image_xscale),sign(image_yscale),image_angle,c_white,alpha)
else if sprite_index == sAirttack
	draw_sprite_ext(weapon1Sprite3,image_index,x,y+6,sign(image_xscale),sign(image_yscale),image_angle,c_white,alpha)
else if sprite_index == sAttack[1] 
	draw_sprite_ext(weapon1Sprite2,image_index,x,y,sign(image_xscale),sign(image_yscale),image_angle,c_white,alpha)
else if sprite_index == sAttack[2]
	draw_sprite_ext(weapon1Sprite3,image_index,x,y,sign(image_xscale),sign(image_yscale),image_angle,c_white,alpha)

if image_index==image_number-1 and !attacking alpha=0

if image_index>3 and ((firstAttack and !attacking) or sprite_index == sAttack[2]){ //fade off
	alpha-=.045
}else{ 
	alpha+=.035
}
	
if alpha>=1 alpha=1
if alpha<=0 alpha=0

//ranged attack
switch weapon2 {
	case "Gun Revla":
		weapon2Sprite = sIGunRevla
		break
}

if image_xscale==defaultScale
	if  (global.playerDir <= 360 and global.playerDir>=270) or (global.playerDir > 0 and global.playerDir<=90)
		shootDir = global.playerDir
	else shootDir = 0
else 
	if !( (global.playerDir < 360 and global.playerDir>270) or (global.playerDir > 0 and global.playerDir<90) )
		shootDir = global.playerDir+180
	else shootDir = 0

if sprite_index == sShoot
		draw_sprite_ext(weapon2Sprite,image_index,x,y-20,sign(image_xscale),sign(image_yscale),shootDir,c_white,1)

draw_self()

event_inherited();

inventoryTurnOn = gamepad_button_check_pressed(0,gp_padu) or gamepad_button_check_pressed(0,gp_padd) or keyboard_check(ord("H")) or mouse_wheel_down() or mouse_wheel_up()
if inventoryTimer<=0 inventoryTimer=0

if inventoryTurnOn
	inventoryTimer=50

if inventoryTimer--
	drawInventory(global.totItemTypes, [ds_list_size(global.inventoryWeapon1), ds_list_size(global.inventoryWeapon2), ds_list_size(global.inventoryEquip)])
