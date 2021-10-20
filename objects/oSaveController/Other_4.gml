previRoom_IsAStage = ds_list_find_index(global.roomTypeStage,global.previRoom)>-1

if global.actualRoomType=="stage" and previRoom_IsAStage
	checkpoint=true