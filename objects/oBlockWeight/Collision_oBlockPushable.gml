if image_index==0{
	shakeScreen(10,"vertical")
	image_index=2
}

if delayToActivate
	delay++

if delay>=90{
	global.progress[? "Area A active1"]=true
	if sprite_index!=sWeightBreak{
		image_index=0
		sprite_index=sWeightBreak
	}
	if image_index>=image_number-1
		instance_destroy(self)
}
