keyInit()

if instance_exists(oPlayer) 
	room_persistent=false

if keyPause and (global.actualRoomType=="stage" or global.actualRoomType=="pause")
	pause(!pause(global.actualRoomType=="stage"))

if keyQuit 
	game_end()
	
if keyDebug 
	global.debug = !global.debug
	
if global.debug and keyRestart
	oSaveController.restart=1
	
if exitStage{
	exitStage=false
	room_goto(rUITitle)
}
if restart{
	if global.actualRoomType=="stage"{
		oPlayer.startPosition()
		restart=false
	}
}
if load{
	if global.actualRoomType=="stage"{
		oSaveController.loadGame=true
		load=false
	}
}


//da room rArea1 em diante
if room!=rInitialize and room!=rUITitle{ 
	if ds_list_find_index(global.roomTypeStage,room)>-1{
		instance_activate_object(oSaveController)
		global.actualRoomType="stage"
	}
	if ds_list_find_index(global.roomTypeUI,room)>-1{
		instance_deactivate_object(oSaveController)
		global.actualRoomType="ui"
	}
}
