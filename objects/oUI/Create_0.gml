x=display_get_gui_width()/2
y=display_get_gui_height()/2

switch room{
	case rUIScreenTitle:
		//title
		var _title = instance_create_depth(x,y-240,depth+100,oBtn)
		_title.btnIndex="title"
		//load
		var _load =  instance_create_depth(x,y,    depth+100,oBtn)
		_load.btnIndex="load"
		//new
		var _new =   instance_create_depth(x,y+80, depth+100,oBtn)
		_new.btnIndex="new"
		//conf
		var _conf =  instance_create_depth(x,y+160,depth+100,oBtn)
		_conf.btnIndex="conf"
		//quit
		var _quit =  instance_create_depth(x,y+240,depth+100,oBtn)
		_quit.btnIndex="quit"
		
		break
	
	case rUIScreenPause:
		break
}
