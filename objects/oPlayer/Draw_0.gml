/// @description Description

// Inherit the parent event
event_inherited();

firstAttack = sprite_index == sAttack[0] or sprite_index == sAirttack or sprite_index == sRunttack

switch weapon1 {
	case "Blade Wu":
		weapon1Sprite1 = sIBladeWuAtk1
		weapon1Sprite2 = sIBladeWuAtk2
		weapon1Sprite3 = sIBladeWuAtk3
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
	//show_debug_message(image_alpha)
}else{ 
	alpha+=.035
	//show_debug_message("n")
}
	
if alpha>=1 alpha=1
if alpha<=0 alpha=0


draw_self()