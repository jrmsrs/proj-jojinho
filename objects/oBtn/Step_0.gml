if collision_rectangle(x-width/2,y+height/2,x+width,y-height/2,oMouseCursor,0,1){
	mouseSelected=true
	if 
	mouse_check_button_pressed(mb_left) or 
	keyboard_check_pressed(vk_enter) or 
	keyboard_check_pressed(vk_space) or  
	gamepad_button_check_pressed(0,gp_face1){
		switch btnIndex{
			case "title":
				url_open("https://github.com/jrmsrs/proj-jojinho")
				break
			case "resume":
				pause(!pause(0))
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
			case "menu":
				room_goto(global.previRoom)
				oGame.exitStage=true
				break
			case "quit":
				game_end()
				break
		}
	}
}else 
	mouseSelected=false

