onFloor = place_meeting(x,y+6,oWall)
jumping = vSpeed<0 or (vSpeed==0 and !onFloor)

//STATE MACHINE
enumInit()

switch currentState {
	case states.IDLEBY:
		if sprite_index != sIdleby{
			idleTimer=0
			image_index=0
		}
		sprite_index = sIdleby
		if keyboard_check_pressed(vk_anykey) or idleTimer>=100{
			currentState=states.IDLE
			idleTimer=0
		}
		gravity()
		idleTimer++
		break
	
	case states.IDLE:
		if sprite_index != sIdle
			image_index=0
		sprite_index = sIdle
		if keyboard_check_pressed(vk_anykey) idleTimer=0
		if idleTimer>=500
			currentState=states.IDLEBY
		if hAxis!=0
			currentState=states.RUN
		if vSpeed!=0
			currentState=states.AIR
		if attacking
			currentState=states.ATTACK
		if dashing
			currentState=states.DASH
		accelDecel()
		jump()
		gravity()
		idleTimer++
		break
		
	case states.DASH: 
		if sprite_index != sDash
			image_index=0
		sprite_index = sDash
		if image_index>=image_number-1{
			currentState=states.IDLE
			dashing=0
		}
		hSpeed=7.5*sign(image_xscale)
		vSpeed=0
		break
		
	case states.RUN:
		if sprite_index != sRun
			image_index=0
		sprite_index = sRun
		if hAxis==0
			currentState=states.IDLE
		if vSpeed!=0
			currentState=states.AIR
		if attacking
			currentState=states.RUNTTACK
		if dashing
			currentState=states.DASH
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
		if dashing
			currentState=states.DASH
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
		
	case states.RUNTTACK:
		hSpeed+=(.04*sign(-image_xscale))
		if sprite_index != sRunttack
			image_index=0
		sprite_index = sRunttack
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