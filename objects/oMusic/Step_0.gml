switch(abs(num)%6){
	case 0:
		//audio_sound_gain(global.previMusic,0,200)
		global.actualMusic=muTitleScreen
		break
	case 1:
		//audio_sound_gain(global.previMusic,0,200)
		global.actualMusic=muAreaA
		break
	case 2:
		//audio_sound_gain(global.previMusic,0,200)
		global.actualMusic=muAreaB
		break
	case 3:
		//audio_sound_gain(global.previMusic,0,200)
		global.actualMusic=muPreBoss
		break
	case 4:
		//audio_sound_gain(global.previMusic,0,200)
		global.actualMusic=muBossBattle
		break
	case 5:
		//audio_sound_gain(global.previMusic,0,200)
		global.actualMusic=muEnd
		break
}
if !audio_is_playing(global.actualMusic) 
	audio_play_sound(global.actualMusic,1000,0)
audio_sound_gain(global.previMusic,0,200)
audio_sound_gain(global.actualMusic,1,200)