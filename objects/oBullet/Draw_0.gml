draw_sprite(sIGunBullet,0,lengthdir_x(20, dir),lengthdir_y(20, dir))
draw_sprite_ext(sIGunBullet,0,x+lengthdir_x(3, dir),y+lengthdir_y(3, dir),image_xscale,image_xscale,image_angle,image_blend,image_alpha-.5)
draw_sprite_ext(sIGunBullet,0,x-lengthdir_x(3, dir),y-lengthdir_y(3, dir),image_xscale,image_xscale,image_angle,image_blend,image_alpha-.5)

draw_self()
