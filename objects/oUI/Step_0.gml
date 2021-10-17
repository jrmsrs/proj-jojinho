keyInit()

if canSet and (keyUp or keyDown) and oMouseCursor.inUse {
	oMouseCursor.inUse=false
	global.keyUISelected=1000
}

if canSet and keyUp global.keyUISelected--
if canSet and keyDown global.keyUISelected++

if keyUp or keyDown canSet=false
else canSet=true

switch room{
	case rUIScreenTitle:
		if keyUp or keyDown
			window_mouse_set(
				display_get_gui_width()/2 + 70,
				display_get_gui_height()/2 + 80 * abs(global.keyUISelected%4)
			)
		break
	
	case rUIScreenPause:
		if keyUp or keyDown
			window_mouse_set(
				display_get_gui_width()/2 + 70,
				display_get_gui_height()/2 + 80 * abs(global.keyUISelected%5) - 80
			)
		break
}