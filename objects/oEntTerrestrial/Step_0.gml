onFloor = place_meeting(x,y+6,oWall)
running = hSpeed!=0
jumping = vSpeed<0 or (vSpeed==0 and !onFloor)
falling = vSpeed>0

//STATE MACHINE
enumInit()

switch currentState {
	case states.IDLE:
		if sprite_index != getSpriteIdle()
			image_index=0
		sprite_index = getSpriteIdle()
		frictionMove()
		jumpMove()
		if hAxis!=0
			currentState=states.MOVE
		if vSpeed!=0
			currentState=states.AIR
		
		break
		
	case states.MOVE:
		if sprite_index != getSpriteRun()
			image_index=0
		sprite_index = getSpriteRun()
		flipMove()
		frictionMove()
		jumpMove()
		if hAxis==0
			currentState=states.IDLE
		if vSpeed!=0
			currentState=states.AIR
		break
		
	case states.AIR:
		if sprite_index != getSpriteJump()
			image_index=0
		sprite_index = getSpriteJump()
		flipMove()
		frictionMove()
		walljumpMove()
		if vSpeed==0 and onFloor
			currentState=states.IDLE
		break
	
	case states.ATTACK: 
		
		break
}

gravityMove()
collisionMove()
//walljumpMove()

if debug{
	switch currentState{
		case states.IDLE: show_debug_message("Idle"); break
		case states.MOVE: show_debug_message("Move"); break
		case states.AIR : show_debug_message("Air"); break
	}
}

resetIfOut()