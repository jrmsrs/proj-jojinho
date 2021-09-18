onFloor = place_meeting(x,y+6,oWall)
jumping = vSpeed<0 or (vSpeed==0 and !onFloor)

//STATE MACHINE
enumInit()

switch currentState {
	case states.IDLE:
		if sprite_index != sIdle
			image_index=0
		sprite_index = sIdle
		if hAxis!=0
			currentState=states.MOVE
		if vSpeed!=0
			currentState=states.AIR
		if attacking
			currentState=states.ATTACK
		if dashing
			currentState=states.DASH
		accelDecel()
		jump()
		gravity()
		break
		
	case states.DASH: 
		if sprite_index != sDash
			image_index=0
		sprite_index = sDash
		if image_index>=image_number-1{
			currentState=states.IDLE
			dashing=0
		}
		hSpeed=3.5*sign(image_xscale)
		break
		
	case states.MOVE:
		if sprite_index != sRun
			image_index=0
		sprite_index = sRun
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
		if sprite_index != sAir[0] and sprite_index != sAir[1]
			image_index=0
		if jumping sprite_index = sAir[0]
		else sprite_index = sAir[1]
		if vSpeed==0 and onFloor
			currentState=states.IDLE
		if attacking
			currentState=states.AIRTTACK
		if image_index>=image_number-1
			image_index=image_number-1
		flipToDirection()
		accelDecel()
		wallJump()
		gravity()
		break
	
	case states.ATTACK: 
		hSpeed=0
		if sprite_index != sAttack[0]
			image_index=0
		sprite_index = sAttack[0]
		if image_index>=image_number-1{
			currentState=states.IDLE
			attacking=0
		}
		break
		
	case states.AIRTTACK:
		if sprite_index != sAirttack
			image_index=0
		sprite_index = sAirttack
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