/// @description sound effects

switch currentState{
	case states.HURT:
		if sprite_index!=sHurt
			audio_play_sound(sfZombHurt,1,false)
		break
}
