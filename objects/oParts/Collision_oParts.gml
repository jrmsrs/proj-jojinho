randomize()


if timer<=10{
	image_angle=random_range(0,360)
	hSpeed=7*sign(x-other.x)+choose(.5,-.5)
	vSpeed=7*sign(y-other.y)+choose(.5,-.5)
}