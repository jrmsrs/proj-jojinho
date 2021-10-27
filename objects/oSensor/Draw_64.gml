if draw{
	draw_set_halign(fa_center)
	draw_set_halign(fa_middle)
	switch (dialogue){
		case "leftright": case "up": case "jump": case "highjump": case "dash": case "walljump": case "attack1": case "attack2":
			break
		default:	
			draw_text(display_get_gui_width()/2,display_get_gui_height()/2,dialogue)
			break
	}
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}