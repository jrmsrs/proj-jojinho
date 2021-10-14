x=mouse_x
y=mouse_y
if mouse_check_button(mb_middle){
	image_index=1
	image_angle+=4
}
else{
	image_index=0
	image_angle++
}
if image_angle>=355 image_angle=0