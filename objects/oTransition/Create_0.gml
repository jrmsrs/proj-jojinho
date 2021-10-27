oEntCreature.statesInit()

enum trans {
	NONE, //0
	READY, //1
	IN,
	OUT
}

image=0
global.transitionState = trans.IN
rot=45

oPlayer.sprite_index=oPlayer.sIdle
oPlayer.hSpeed=0
oPlayer.vSpeed=0


if oPlayer.currentState!=states.DEAD
	oPlayer.currentState=-1 //non existent (frozen)