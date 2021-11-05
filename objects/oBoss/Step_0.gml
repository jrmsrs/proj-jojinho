///@description sound effects

if form=="humanoid"{
	switch currentState{
		case states.ATTACK:
			if sprite_index!=sAttack[0]
				audio_play_sound(sfBossBladeSlash1,1,0)
			break
		case states.DEFEND:
			if sprite_index!=sDefend 
				audio_play_sound(sfBossDefend,1,0)
			break
		case states.HURT:
			if sprite_index!=sHurt
				audio_play_sound(sfBossHurt,1,0)
			break
		case -1:
			if sprite_index!=sBossTransform
				audio_play_sound(sfBossTransition,1,0)
			break
	}
}else{
	switch currentState{
		case aiFlyingStates.ATTACK:
			if sprite_index!=sAttack
				audio_play_sound(sfBossBladeSlash2,1,0)
			break
		case aiFlyingStates.HURT:
			if sprite_index!=sHurt
				audio_play_sound(sfBossHurt,1,0)
			break
	}
}

if !invincible{
	if audio_is_paused(sfBossGrunning)
		audio_resume_sound(sfBossGrunning)
}else
	audio_pause_sound(sfBossGrunning)

event_inherited();