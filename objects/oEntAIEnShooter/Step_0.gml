event_inherited();

if !object_exists(oPlayer) exit

var willCollide = place_meeting(x+10*sign(image_xscale),y,oWall)
var floorAhead = place_meeting(x+10*sign(image_xscale),y+10,oWall)

function sensor(){
	if place_meeting(x+(distanceSensor*sign(image_xscale)),y,oPlayer){
		return true
	}
	if distanceSensor>=maxRange 
		distanceSensor=0
	distanceSensor+=3
	return false
}

switch(currentState){
	case states.IDLE:
		hAxis=0
		if distance_to_object(oPlayer)<=shootRange and sign(image_xscale)==sign(oPlayer.x-x){
			shooting=true
		}
		if iaTimer++ >= iaDelay or sensor(){
			iaTimer=0
			iaDelay=irandom(400)+200
			currentState=states.RUN
			hAxis=sign(image_xscale)
		}
		
		break
		
	case states.RUN:
		
		if iaTimer++ >= iaDelay{
			iaTimer=0
			iaDelay=irandom(400)+200
			currentState=states.IDLE
			hAxis=0
		}
		if willCollide or !floorAhead
			hAxis=-hAxis
			
		if distance_to_object(oPlayer)<=shootRange and sign(image_xscale)==sign(oPlayer.x-x){
			currentState=states.IDLE
			hAxis=0
		}
		break
		
	case states.HURT:
		if sprite_index!=sHurt{
			if sign(image_xscale)!=sign(oPlayer.x-x)
				image_xscale=-image_xscale
		}
		break
		
	case states.SHOOTTACK:
		if sign(x-oPlayer.x)==sign(image_xscale) currentState=states.IDLE
		if image_index==image_number-2{
			var bull=instance_create_layer(x,y-19*defaultScale,"Game",oEnemyBullet)
			bull.owner = object_index 
		}
		break
}

if distance_to_object(oPlayer)>15 and distance_to_object(oPlayer)<=50 
	image_xscale=defaultScale*sign(oPlayer.x-x)
	