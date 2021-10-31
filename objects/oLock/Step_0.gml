if ds_map_exists(global.progress,progressName){
	if global.progress[? "Area A done"]{
		image_index=1
		exit
	}
}

if place_meeting(x,y,oEntHumanoid) and global.inventoryEquip{
	image_index=1
	destination.active=true
}