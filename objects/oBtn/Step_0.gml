if collision_rectangle(x-width/2,y+height/2,x+width,y-height/2,oMouseCursor,0,1){
	selected=true
	if mouse_check_button_pressed(mb_left){
		switch btnIndex{
			case "title":
				url_open("http://github.com/jrmsrs/proj-jojinho")
				break
			case "load":
				show_message("nada")
				break
			case "new":
				room_goto_next()
				break
			case "conf":
				show_message("nada")
				break
			case "quit":
				game_end()
				break
		}
	}
}else 
	selected=false
