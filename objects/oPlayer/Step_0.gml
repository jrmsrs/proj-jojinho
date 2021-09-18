keyInit()
hAxis = round(keyRight-keyLeft)
if keyAttack attacking=1
if keyDash dashing=1

event_inherited();

//Opções individuais do oPlayer
if keyJumpPressed jumpPressTime=jumpPressTimeMax
if jumpPressTime>0 and !keyJumpHold jumpPressTime--
//Pulo medio
if jumping and keyJumpReleased vSpeed = vSpeed/2

show_debug_message(jumpPressTime)