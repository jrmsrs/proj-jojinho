switch room{
	case rUITitle:
		mus=music.TITLE
		global.previMusic=global.actualMusic
		break
	case rAreaAC:
	case rAreaA1:
	case rAreaA3:
		mus=music.A
		global.previMusic=global.actualMusic
		break
	case rAreaBC:
	case rAreaB1:
	case rAreaB3:
	case rAreaB4:
		mus=music.B
		global.previMusic=global.actualMusic
		break
}