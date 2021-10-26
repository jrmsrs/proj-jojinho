//check if checkpoint are the same as room (for every existing checkpoint and respective room)
if (global.checkPoint=="A" and room==rAreaAC) or 
   (global.checkPoint=="B" and false){
	active=true
}

if active{
	global.checkPoint=checkpointName
	if place_meeting(x,y,oPlayer){
		if !override{
			if sprite_index!=sCheckpointOverride{
				sprite_index=sCheckpointOverride
				image_index=0
			}
			if image_index>=image_number-1{
				override=true
				oSaveController.saveGame=true
			}
		}else{
			sprite_index=sCheckpointActive
		}
	}else{
		sprite_index=sCheckpointActive
		override=false
	}
}else{
	if place_meeting(x,y,oPlayer){
		if sprite_index!=sCheckpointBreak{
			sprite_index=sCheckpointBreak
			image_index=0
		}
		if image_index>=image_number-1{
			override=true
			active=true
			oSaveController.saveGame=true
		}
	}else{
		sprite_index=sCheckpointAvailable
	}
}
