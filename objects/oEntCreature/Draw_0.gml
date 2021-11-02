var debugValues=[
	"state",
	currentState,
]

if target
	draw_sprite_stretched(sTargetIndicator,0,x-15-1,y-50-1,32,6)

if selected{
	draw_sprite_stretched(sHealthBar,0,x-15,y-sprite_height,30,4)
	draw_sprite_stretched(sHealthBar,1,x-15,y-sprite_height,(life/maxLife)*30,4)
}

if global.debug{
	draw_set_halign(fa_center)
	draw_text(x,y-70,string(debugValues))
	//draw_text(x,y-70,string(hSpeed))
	draw_set_halign(fa_left)
}

draw_self()