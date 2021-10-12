event_inherited();

if !debug exit
switch currentState{
	case states.IDLEBY: 
	case states.IDLE: 
		draw_text(x,y-sprite_height,"Idle")
		break
		
	case states.DASH: 
		draw_text(x,y-sprite_height,"Dash")
		break
		
	case states.RUN: 
		draw_text(x,y-sprite_height,"Run")
		break
		
	case states.AIR : 
		draw_text(x,y-sprite_height,"Air")
		break
		
	case states.ATTACK: 
		draw_text(x,y-sprite_height,"Attack")
		break
		
	case states.AIRTTACK: 
		draw_text(x,y-sprite_height,"Airttack")
		break
		
	case states.RUNTTACK: 
		draw_text(x,y-sprite_height,"Runttack")
		break
	
	case states.HURT:
		draw_text(x,y-sprite_height,"Hurt")
		break
		
	case states.HURTFALL:
		draw_text(x,y-sprite_height,"Hurtfall")
		break
		
	case states.HURTFALLBACK:
		draw_text(x,y-sprite_height,"Hurtfallback")
		break
		
	case states.FAINT:
		draw_text(x,y-sprite_height,"Faint")
		break
	
}