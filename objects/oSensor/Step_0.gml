if global.debug visible=true
else visible=false

if place_meeting(x,y,oPlayer){
	oPlayer.persistent=true
	var roomChange = instance_create_depth(x,y,depth,oRoomChange)
	roomChange.destination = destination
	roomChange.destinationX = destinationX
	roomChange.destinationY = destinationY-1
}
