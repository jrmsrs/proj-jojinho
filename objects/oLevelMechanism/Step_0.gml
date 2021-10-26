//to persist
if ds_map_exists(global.progress,progressName){
	if global.progress[? progressName] { //same for every room
		active=true
		image_angle=90
		exit
	}
}

if active{
	image_angle++
	if image_angle>=90 image_angle=90
}else{
	image_angle--
	if image_angle<=0 image_angle=0
}
