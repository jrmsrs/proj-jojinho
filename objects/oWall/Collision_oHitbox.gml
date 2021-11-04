/// @description sound effects

if other.layer != layer_get_id("PlayerBladeHitbox") exit

if place_meeting(x+10,y,oPlayer) or place_meeting(x-101,y,oPlayer)
	audio_play_sound(sfPlayerBladeWall,1,false)