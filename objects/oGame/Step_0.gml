keyInit()

if instance_exists(oPlayer) 
	room_persistent=false

if keyPause and (global.actualRoomType="stage" or global.actualRoomType="pause")
	pause(!pause(global.actualRoomType=="stage"))

if keyQuit 
	game_end()
	
if keyDebug 
	global.debug = !global.debug
	
if global.debug and keyRestart 
	room_restart()
	
if exitStage{
	exitStage=0
	room_goto(rUIScreenTitle)
}