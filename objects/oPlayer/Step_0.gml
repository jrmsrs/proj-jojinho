keyInit()
hAxis = round(keyRight-keyLeft)
if keyAttack attacking=1
if keyDash and dashTimer>=100{
	dashing=1
	dashTimer=0
}

if dashTimer>=dashMax{
	dashTimer=dashMax
}

event_inherited();

//Opções individuais do oPlayer
if keyJumpPressed jumpPressTime=jumpPressTimeMax
if jumpPressTime>0 and !keyJumpHold jumpPressTime--
//Pulo medio
if jumping and keyJumpReleased vSpeed = vSpeed/2

dashTimer++