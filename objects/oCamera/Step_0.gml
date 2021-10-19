/// @description Description
keyInit()

if !object_exists(oPlayer) exit

xCam = clamp(oPlayer.x - wCam / 2, 0, room_width - wCam)
yCam = clamp(oPlayer.y - hCam / 2, 0, room_height - hCam)

if xCam - 100 > 0 
	xCam -= 100 * keyLeftSec
if xCam + 100 < (room_width - wCam)
	xCam += 100 * keyRightSec
if yCam - 100 > 0 
	yCam -= 100 * keyUpSec
if yCam + 100 < (room_height - hCam)
	yCam += 100 * keyDownSec


curX = camera_get_view_x(view_camera[0])
curY = camera_get_view_y(view_camera[0])


newX = lerp(curX, xCam, 0.1)
newY = lerp(curY, yCam, 0.1)

camera_set_view_pos(view_camera[0], newX, newY)
roomDefine()
