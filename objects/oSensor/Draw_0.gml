if draw{
	draw_set_halign(fa_center)
	draw_set_halign(fa_middle)
	switch (dialogue){
		case "leftright":
			dialogSprite=sHintLeftRight
			break
		case "up":
			dialogSprite=sHintUp
			break
		case "jump":
			dialogSprite=sHintJump
			break
		case "highjump":
			dialogSprite=sHintHighJump
			break
		case "dash":
			dialogSprite=sHintDash
			break
		case "walljump":
			dialogSprite=sHintWalljump
			break
		case "attack1":
			dialogSprite=sHintAttack1
			break
		case "attack2":
			dialogSprite=sHintAttack2
			break
		default:
			exit 
	}
	draw_sprite_ext(dialogSprite,dialogSpriteImg,oPlayer.x,oPlayer.y-oPlayer.sprite_height,2,2,0,c_white,1)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}