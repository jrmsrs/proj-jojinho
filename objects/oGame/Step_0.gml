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
	room_restart()
	
if exitStage{
	exitStage=false
	room_goto(rUIScreenTitle)
}

if load{
	load=false
	var loadBuffer = buffer_load("save.save")
	game_load_buffer(loadBuffer)
}

if ds_list_find_index(global.roomTypeStage,room)>-1
	global.actualRoomType="stage"

if ds_list_find_index(global.roomTypeUI,room)>-1
	global.actualRoomType="ui"

