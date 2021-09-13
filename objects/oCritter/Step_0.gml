if hAxis!=0
	if hSpeed!=0 sprite_index = sRun else sprite_index = sIdle
else sprite_index = sIdle

event_inherited();

if vSpeed!=0 or (vSpeed==0 and !place_meeting(x,y+3,oWall)) sprite_index=sJump

cont+=inc
if cont>=253 or cont<=3 inc=-inc

image_blend=cont