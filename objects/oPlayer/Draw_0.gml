/// @description Description

// Inherit the parent event
event_inherited();

switch weapon1 {
	case "Blade Wu":
		weapon1Sprite1 = sIBladeWuAtk1
		weapon1Sprite2 = sIBladeWuAtk1
		weapon1Sprite3 = sIBladeWuAtk1
		break
}

if sprite_index == sAttack[0] or sprite_index == sAirttack or sprite_index == sRunttack
	draw_sprite_ext(weapon1Sprite1,image_index,x,y,sign(image_xscale),sign(image_yscale),image_angle,c_white,1)

draw_self()