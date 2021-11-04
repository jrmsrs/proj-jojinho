/// @description sound effects

switch currentState{
	case states.HURT:
		if sprite_index!=sHurt
			audio_play_sound(sfSniperHurt,1,false)
		break
}
