if _explode{
	show_debug_message("explodindo")
	image_speed=1
	image_index=3
	_explode=false
}

if image_speed>=1{
	if image_index>=4 image_alpha-=.04
	if image_index>=image_number-1
		image_index=image_number-1
}

if image_alpha<=0 
	instance_destroy()
