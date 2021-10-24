draw_set_halign(fa_center)
draw_set_valign(fa_middle)

switch room{
	case rUITitle:
		draw_text(x,y-240,"proj-jojinho")
		draw_text(x,y,    "load game")
		draw_text(x,y+80, "new game")
		draw_text(x,y+160,"settings")
		draw_text(x,y+240,"quit game")
		break
	
	case rUIGame:
		draw_text(x,y-240,"resume")
		draw_text(x,y-160,"restart")
		draw_text(x,y-80, "load")
		draw_text(x,y,    "save")
		draw_text(x,y+80, "settings")
		draw_text(x,y+160,"back to menu")
		draw_text(x,y+240,"quit game")
		break
}
