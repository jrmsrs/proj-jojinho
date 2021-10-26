//check if checkpoint are the same as room (for every existing checkpoint and respective room)
if (global.checkPoint=="A" and room==rAreaAC) or 
   (global.checkPoint=="B" and false){
	active=true
}

if active{
	sprite_index=sCheckpointActive
	global.checkPoint=checkpointName
}else{
	if place_meeting(x,y,oPlayer){
		if sprite_index!=sCheckpointBreak{
			sprite_index=sCheckpointBreak
			image_index=0
		}
		if image_index>=image_number-1{
			active=true
		}
	}else{
		sprite_index=sCheckpointAvailable
	}
}