/// @description Description

x_cam = clamp(oPlayer.x - w_cam / 2, 0, room_width - w_cam)
y_cam = clamp(oPlayer.y - h_cam / 2, 0, room_height - h_cam)

cur_x = camera_get_view_x(view_camera[0])
cur_y = camera_get_view_y(view_camera[0])

new_x = lerp(cur_x, x_cam, 0.1)
new_y = lerp(cur_y, y_cam, 0.1)

camera_set_view_pos(view_camera[0], new_x, new_y)

//parallax 1
layer_x(layer_get_id("Background"), new_x * 0.95 +(i1--/10)) //move-se sozinho lentamente (-1px/10) à esquerda
layer_y(layer_get_id("Background"), new_y * 0.5)

//parallax 2
layer_x(layer_get_id("Backgrounds_1"), new_x * 0.85)
layer_y(layer_get_id("Backgrounds_1"), new_y * 0.4)

//parallax 3
//layer_x(layer_get_id("Background"), new_x * 0.65)
//layer_y(layer_get_id("Background"), new_y * 0.65)