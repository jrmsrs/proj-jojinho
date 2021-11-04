globalVarsInit()

instance_create_layer(x,y,layer,oMusic)

exitStage=false
restart=false
load=false

//methods
pause = function(i){
	if i {
		room_persistent = true
		global.actualRoomType="pause"
		room_goto(rUIGame)
		return false
	}else{
		global.actualRoomType="stage"
		return true
	}
}
