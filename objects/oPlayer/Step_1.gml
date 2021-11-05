/// @description sound effects

switch currentState{
	
	case states.AIR:
		if jumping and sprite_index != sAir[0]
			audio_play_sound(sfPlayerJump,1,false)
		break
		
	case states.DASH:
		if sprite_index!=sDash
			audio_play_sound(sfPlayerDash,1,false)
		break	
		
	case states.RUN:
		if !audio_is_playing(sfPlayerRun)
			if onFloor audio_play_sound(sfPlayerRun,1,false)
		break
		
	case states.AIRTTACK:
	case states.RUNTTACK:
	case states.ATTACK:
		if image_index>=image_number-1 
			audio_play_sound(sfPlayerBladeSlash,1,false)
		break
		
	case states.HURT:
		if sprite_index!=sHurt
			audio_play_sound(sfPlayerBladeSlashHit,1,false)
		audio_sound_gain(global.actualMusic,global.musicVolume,1000)
		break
}
