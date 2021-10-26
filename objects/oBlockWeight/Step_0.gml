bottom_y = y + sprite_height/2

//to persist
if ds_map_exists(global.progress,progressName){
	if global.progress[? "Area A active1"]{
		tied=false
		y=1008-sprite_height/2
		mask_index=_sMinimumCollisionMask
		exit
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