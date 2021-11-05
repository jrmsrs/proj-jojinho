if room==rAreaB4{
	if instance_exists(oBoss)
		if oBoss.form=="static" setMusic(music.PRE_BOSS) else setMusic(music.BOSS)
	else setMusic(music.B)
}

switch(mus){
	case music.TITLE:
		global.actualMusic=muTitleScreen
		break
	case music.A:
		global.actualMusic=muAreaA
		break
	case music.B:
		global.actualMusic=muAreaB
		break
	case music.PRE_BOSS:
		global.actualMusic=muPreBoss
		break
	case music.BOSS:
		global.actualMusic=muBossBattle
		break
	case music.END:
		global.actualMusic=muEnd
		break
}

if !audio_is_playing(global.actualMusic) 
	audio_play_sound(global.actualMusic,1000,0)

audio_sound_gain(global.previMusic,0,200)
audio_sound_gain(global.actualMusic,global.musicVolume,200)