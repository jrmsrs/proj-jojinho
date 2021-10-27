if ds_map_exists(global.progress,progressName){
	if global.progress[? "Area A active1"]{
		image_index=1
		exit
	}
}

if place_meeting(x,y,oEntHumanoid) or place_meeting(x,y,oBlockWeight){
	image_index=1
	destination.active=true
}else{
	image_index=0
	destination.active=false
}
