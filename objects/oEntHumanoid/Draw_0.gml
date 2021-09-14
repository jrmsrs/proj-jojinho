draw_self()

if !debug exit
switch currentState{
	case states.IDLE: 
		draw_text(x,y-sprite_height,"Idle")
		break
		
	case states.MOVE: 
		draw_text(x,y-sprite_height,"Move")
		break
		
	case states.AIR : 
		draw_text(x,y-sprite_height,"Air")
		break
		
	case states.ATTACK : 
		draw_text(x,y-sprite_height,"Attack")
		break
		
	
}