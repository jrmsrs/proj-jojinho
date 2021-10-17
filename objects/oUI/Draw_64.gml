draw_set_halign(fa_center)
draw_set_valign(fa_middle)

switch room{
	case rUIScreenTitle:
		//title
		draw_text(x,y-240,"proj-jojinho")
		//load
		draw_text(x,y,    "load game")
		//new
		draw_text(x,y+80, "new game")
		//conf
		draw_text(x,y+160,"settings")
		//quit
		draw_text(x,y+240,"quit game")
		break
	
	case rUIScreenPause:
		break
}
