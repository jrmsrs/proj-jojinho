bottom_y = y + sprite_height/2

//to persist
if ds_map_exists(global.progress,progressName){
	if global.progress[? "Area A active1"]{
		instance_destroy()
	}
}

//Collision top/down
if place_meeting(x,y+vSpeed,oWall) {
	while(!place_meeting(x,y+sign(vSpeed),oWall)) y+=sign(vSpeed)
	vSpeed = 0
}
y+=vSpeed 

if !tied applyGravity()

if instance_exists(oBlockPushable){
	if distance_to_point(oBlockPushable.x, oBlockPushable.y)<=6
		delayToActivate=true
}