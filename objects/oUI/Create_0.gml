keyInit()

canSet=true

global.keyUISelected=1000

x=display_get_gui_width()/2
y=display_get_gui_height()/2

switch room{
	case rUITitle:
		window_mouse_set(
			display_get_gui_width()/2 + 70,
			display_get_gui_height()/2
		)
		//title
		btnTitle = instance_create_depth(x,y-240,depth+100,oBtn)
		btnTitle.btnIndex="title"
		//load
		btnLoad =  instance_create_depth(x,y,    depth+100,oBtn)
		btnLoad.btnIndex="continue"
		//new
		btnNew =   instance_create_depth(x,y+80, depth+100,oBtn)
		btnNew.btnIndex="new"
		//conf
		btnConf =  instance_create_depth(x,y+160,depth+100,oBtn)
		btnConf.btnIndex="conf"
		//quit
		btnQuit =  instance_create_depth(x,y+240,depth+100,oBtn)
		btnQuit.btnIndex="quit"
		break
	
	case rUIGame:
		window_mouse_set(
			display_get_gui_width()/2 + 70,
			display_get_gui_height()/2 - 80
		)
		//resume
		btnResume = instance_create_depth(x,y-80,  depth+100,oBtn)
		btnResume.btnIndex="resume"
		//restart
		btnRestart =instance_create_depth(x,y,     depth+100,oBtn)
		btnRestart.btnIndex="restart"
		//conf
		btnConf =   instance_create_depth(x,y+80,  depth+100,oBtn)
		btnConf.btnIndex="conf" 
		//menu
		btnMenu =   instance_create_depth(x,y+160, depth+100,oBtn)
		btnMenu.btnIndex="menu"
		//quit
		btnQuit =   instance_create_depth(x,y+240, depth+100,oBtn)
		btnQuit.btnIndex="quit"
		break
}