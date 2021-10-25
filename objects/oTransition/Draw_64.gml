if rot<=0
	rot=0
for (row=0; row<=display_get_gui_width();row+=64){
	for (col=0; col<=display_get_gui_height();col+=64){
		draw_sprite_ext(sTransition1,floor(image),row,col,2,2,rot,c_white,1)
	}
}