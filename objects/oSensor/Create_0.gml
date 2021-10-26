canChange=false
change=false

changeRoom = function(){
	var roomChange = instance_create_depth(x,y,depth,oRoomChange)
	roomChange.destination = destination
	roomChange.destinationX = destinationX
	roomChange.destinationY = destinationY-1
}

dialogSprite=sprite_index
dialogSpriteImg=0
dialogSpriteImgTimer=0