keyInit()

var doorChange = keyUp and canChange

if place_meeting(x,y,oPlayer) and (!door or doorChange){
	if destination!=noone{
		oPlayer.persistent=true
		change=true
	}
	if dialogue!="nada"{
		draw=true
	}
}else draw=false

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

if global.debug image_alpha=1 else image_alpha=0