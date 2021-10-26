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
				room_goto(global.previRoom)
				break
			case "restart":
				room_goto(global.previRoom)
				oGame.restart=true
				break
			case "continue":
				if room==rUITitle
					room_goto_next()
				if room==rUIGame
					room_goto(global.previRoom)
				oSaveController.loadGame=true
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
		if !mouse_check_button_pressed(mb_left)
			window_mouse_set(0,0)
	}
}else 
	mouseSelected=false
