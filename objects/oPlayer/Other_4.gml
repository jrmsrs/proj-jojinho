instance_create_layer(x,y,"Game",oCamera)
persistent=false

roomStartLag=20

if global.previRoom==rUITitle{
	transitionCreate()
	global.transitionState = 1
	oTransition.image=10
}