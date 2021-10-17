draw_set_halign(fa_center)
draw_set_valign(fa_middle)

switch room{
	case rUIScreenTitle:
		draw_text(x,y-240,"proj-jojinho")
		draw_text(x,y,    "load game")
		draw_text(x,y+80, "new game")
		draw_text(x,y+160,"settings")
		draw_text(x,y+240,"quit game")
		break
	
	case rUIScreenPause:
		draw_text(x,y-240,"paused")
		draw_text(x,y-80, "resume")
		draw_text(x,y,    "restart")
		draw_text(x,y+80, "settings")
		draw_text(x,y+160,"back to menu")
		draw_text(x,y+240,"quit game")
		break
}
