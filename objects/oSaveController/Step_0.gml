if saveGame{
	save("gs1")
	saveGame=false
}

if loadGame{
	if global.actualRoomType=="stage"{
		load("gs1")
		oPlayer.startPosition()
		loadGame=false
	}
}
