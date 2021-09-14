onFloor = place_meeting(x,y+6,oWall)
jumping = vSpeed<0 or (vSpeed==0 and !onFloor)

//STATE MACHINE
enumInit()

switch currentState {
	case states.IDLE:
		if sprite_index != getSpriteIdle()
			image_index=0
		sprite_index = getSpriteIdle()
		if hAxis!=0
			currentState=states.MOVE
		if vSpeed!=0
			currentState=states.AIR
		if attacking
			currentState=states.ATTACK
		accelDecel()
		jump()
		gravity()
		break
		
	case states.MOVE:
		if sprite_index != getSpriteRun()
			image_index=0
		sprite_index = getSpriteRun()
		if hAxis==0
			currentState=states.IDLE
		if vSpeed!=0
			currentState=states.AIR
		if attacking
			currentState=states.ATTACK
		flipToDirection()
		accelDecel()
		jump()
		gravity()
		break
		
	case states.AIR:
		if sprite_index != getSpriteJump() and sprite_index != getSpriteFall()
			image_index=0
		if jumping sprite_index = getSpriteJump()
		else sprite_index = getSpriteFall()
		if vSpeed==0 and onFloor
			currentState=states.IDLE
		if attacking
			currentState=states.AIRTTACK
		flipToDirection()
		accelDecel()
		wallJump()
		gravity()
		break
	
	case states.ATTACK: 
		hSpeed=0
		if sprite_index != getSpriteAttack()[0]
			image_index=0
		sprite_index = getSpriteAttack()[0]
		if image_index>=image_number-1
			currentState=states.IDLE
			attacking=0
		break
		
	case states.AIRTTACK:
		if sprite_index != getSpriteAirttack()
			image_index=0
		sprite_index = getSpriteAirttack()
		if image_index>=image_number-1
			image_index=image_number-1
		if vSpeed==0 and onFloor
			currentState=states.IDLE
		attacking=0
		flipToDirection()
		accelDecel()
		wallJump()
		gravity()
		break
}

wallCollision()
resetIfOut()