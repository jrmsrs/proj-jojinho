/// @description Description

xCam = clamp(oPlayer.x - wCam / 2, 0, room_width - wCam)
yCam = clamp(oPlayer.y - hCam / 2, 0, room_height - hCam)

curX = camera_get_view_x(view_camera[0])
curY = camera_get_view_y(view_camera[0])

newX = lerp(curX, xCam, 0.1)
newY = lerp(curY, yCam, 0.1)

camera_set_view_pos(view_camera[0], newX, newY)

//parallax 1
layer_x(layer_get_id("Background"), newX * 0.95 +(i1--/10)) //move-se sozinho lentamente (-1px/10) à esquerda
layer_y(layer_get_id("Background"), newY * 0.5)

//parallax 2
layer_x(layer_get_id("Backgrounds_1"), newX * 0.85)
layer_y(layer_get_id("Backgrounds_1"), newY * 0.4)

//parallax 3
//layer_x(layer_get_id("Background"), newX * 0.65)
//layer_y(layer_get_id("Background"), newY * 0.65)