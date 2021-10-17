x=device_mouse_x_to_gui(0)
y=device_mouse_y_to_gui(0)

if inUse {
	image_xscale = originalScale
	image_yscale = originalScale
} else { 
	image_xscale = originalScale//2
	image_yscale = originalScale//2
}

if mouse_check_button(mb_middle){
	image_index=1
	image_angle+=4
}
else{
	image_index=0
	image_angle++
}

if image_angle>=355 image_angle=0