wCam=640
hCam=480

i1=0

curX = 0
curY = 0

newX = 0
newY = 0

camera_set_view_pos(view_camera[0],oPlayer.x+(320*sign(oPlayer.x-room_width)),oPlayer.y+(240*sign(oPlayer.y-room_height)))

//methods
parallaxSetup = function(parallax){
	if parallax==0 exit
	
	//Parallax nuvem
	layer_x(layer_get_id("Parallax1"), newX * 0.95 +(i1--/10)) //move-se sozinho lentamente (-1px/10) à esquerda
	layer_y(layer_get_id("Parallax1"), newY * 0.5)
	if parallax==1 exit
	
	//Parallax montanha
	layer_x(layer_get_id("Parallax2"), newX * 0.85)
	layer_y(layer_get_id("Parallax2"), newY * 0.4)
	if parallax==2 exit
	
	//Parallax ....
	layer_x(layer_get_id("Parallax3"), newX * 0.65)
	layer_y(layer_get_id("Parallax3"), newY * 0.65)
	if parallax==3 exit
	
	//Paralax ....
	layer_x(layer_get_id("Parallax4"), newX * 0.35)
	layer_y(layer_get_id("Parallax4"), newY * 0.35)
}
roomDefine = function(){
	switch(room){
		case rAreaA1: parallaxSetup(0); break
		case rAreaB2: parallaxSetup(2); break
		case rAreaB4: parallaxSetup(2); break
		default: parallaxSetup(0)
	}
}