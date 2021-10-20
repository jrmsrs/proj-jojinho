if mouseSelected
	draw_sprite_stretched_ext(sDebugWall,0,x-width/2,y-height/2+1,width,height,c_white,1)
else
	draw_sprite_stretched_ext(sDebugWall,0,x-width/2,y-height/2+1,width,height,c_black,1)