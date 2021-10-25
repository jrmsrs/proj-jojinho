//Collision top/down
if place_meeting(x,y+vSpeed,oWall) {
	while(!place_meeting(x,y+sign(vSpeed),oWall)) y+=sign(vSpeed)
	vSpeed = 0
}
y+=vSpeed 

if !tied applyGravity()