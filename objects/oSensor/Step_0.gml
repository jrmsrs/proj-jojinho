keyInit()

var doorChange = keyUp and canChange

if place_meeting(x,y,oPlayer) and (!door or doorChange){
	oPlayer.persistent=true
	change=true
}

if change {
	if door{
		if global.transitionState==0
			transitionCreate()
		if global.transitionState==1{
			changeRoom()
			change=false
		}
	}else{
		changeRoom()
		change=false
	}
}

if keyUp canChange=false
else canChange=true

if global.debug visible=true else visible=false
