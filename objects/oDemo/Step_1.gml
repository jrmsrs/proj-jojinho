/// @description sound effects

switch currentState{
	case aiFlyingStates.HURT:
		if sprite_index!=sHurt
			audio_play_sound(sfDemoHurt,1,false)
		break
}
