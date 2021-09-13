/// @description Description

xCam = clamp(oPlayer.x - wCam / 2, 0, room_width - wCam)
yCam = clamp(oPlayer.y - hCam / 2, 0, room_height - hCam)

curX = camera_get_view_x(view_camera[0])
curY = camera_get_view_y(view_camera[0])

newX = lerp(curX, xCam, 0.1)
newY = lerp(curY, yCam, 0.1)

camera_set_view_pos(view_camera[0], newX, newY)
roomDefine()