keyInit()
hAxis = round(keyRight-keyLeft)
if keyAttack && weapon1!="none" attacking=1
if keyDash and dashLimiter{
	dashing=1
	dashLimiter=0
}

event_inherited();

//Opções individuais do oPlayer
if keyJumpPressed jumpPressTime=jumpPressTimeMax
if jumpPressTime>0 and !keyJumpHold jumpPressTime--
//Pulo medio
if jumping and keyJumpReleased vSpeed = vSpeed/2

if onFloor or place_meeting(x+6,y,oWall) dashLimiter = 1