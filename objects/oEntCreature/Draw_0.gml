/// @description Description
draw_self()

if selected{
	draw_sprite_stretched(sHealthBar,0,x-15,y-50,30,4)
	draw_sprite_stretched(sHealthBar,1,x-15,y-50,(life/maxLife)*30,4)
}

if showHealthTimer>=200{
	selected=false
	showHealthTimer=0
}