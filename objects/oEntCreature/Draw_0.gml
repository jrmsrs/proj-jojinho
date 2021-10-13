draw_self()

if target{
	draw_sprite_stretched(sTargetIndicator,0,x-15-1,y-50-1,32,6)
}

if selected{
	draw_sprite_stretched(sHealthBar,0,x-15,y-50,30,4)
	draw_sprite_stretched(sHealthBar,1,x-15,y-50,(life/maxLife)*30,4)
}