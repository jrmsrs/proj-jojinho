wCam=640
hCam=480

i1=0

curX = 0
curY = 0

newX = 0
newY = 0

camera_set_view_pos(view_camera[0],oPlayer.x+(320*sign(oPlayer.x-room_width)),oPlayer.y+(240*sign(oPlayer.y-room_height)))