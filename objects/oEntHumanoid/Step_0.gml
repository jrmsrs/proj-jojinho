event_inherited();

onFloor = place_meeting(x,y+6,oWall)
jumping = vSpeed<0 or (vSpeed==0 and !onFloor)
invincible = currentState==states.FAINT or currentState==states.HURT or currentState==states.HURTFALL or currentState==states.HURTFALLBACK

if object_get_parent(oEntAIEnPatrol) anyKeyPressed=1
if invincible and !currentState==states.HURT hurt=0

switch currentState {
	case states.IDLEBY:
		if sprite_index != sIdleby{
			idleTimer=0
			image_index=0
		}
		sprite_index = sIdleby
		if anyKeyPressed or idleTimer>=100{
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
		if anyKeyPressed idleTimer=0
		if idleTimer>=500
			currentState=states.IDLEBY
		if hAxis!=0 and !place_meeting(x+sign(image_xscale),y,oWall)
			currentState=states.RUN
		if vSpeed!=0
			currentState=states.AIR
		if onFloor and attacking
			currentState=states.ATTACK
		if dashing
			currentState=states.DASH
		if hurt 
			currentState=states.HURT
		if shooting
			currentState=states.SHOOTTACK
		accelDecel()
		jump()
		gravity()
		idleTimer++
		break
		
	case states.DASH: 
		if sprite_index != sDash
			image_index=0
		sprite_index = sDash
		vSpeed=0
		jump()
		if image_index>=image_number-1 or vSpeed!=0{
			currentState=states.IDLE
			dashing=0
		}
		hSpeed=7.5*sign(image_xscale)
		if hurt 
			hurt=0 //invencibilidade
		break
		
	case states.RUN:
		if sprite_index != sRun
			image_index=0
		sprite_index = sRun
		if hAxis==0 or place_meeting(x+sign(image_xscale),y,oWall)
			currentState=states.IDLE
		if vSpeed!=0
			currentState=states.AIR
		if attacking
			currentState=states.RUNTTACK
		if dashing
			currentState=states.DASH
		if hurt 
			currentState=states.HURT
		if shooting
			currentState=states.SHOOTTACK
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
		if hurt 
			currentState=states.HURT
		if shooting
			shooting=0
		if image_index>=image_number-1
			image_index=image_number-1
		flipToDirection()
		accelDecel()
		wallJump()
		gravity()
		break
	
	case states.ATTACK: 
		hSpeed=0
		if sprite_index != sAttack[combo]{
			image_index=0
			attacking--
		}
		sprite_index = sAttack[combo]
		
		if image_index >= 2 {
			if alignment == "player"
				if sprite_index != sAttack[0] and image_index == 2{  //combos acertam por tras
					instance_create_layer(x+12*sign(image_xscale),y-30,"PlayerBladeHitbox",oHitbox)
					instance_create_layer(x+5*-sign(image_xscale),y-30,"PlayerBladeHitbox",oHitbox)
				}else if image_index == 3
					instance_create_layer(x+12*sign(image_xscale),y-30,"PlayerBladeHitbox",oHitbox)
		}
		
		if image_index>=image_number-1{
			if sprite_index == sAttack[2]
				attacking=0
			if !attacking{
				currentState=states.IDLE
				combo=0
			}else{
				combo=++combo%3
			}
		}
		
		if attacking>=2
			attacking=2 //guarda um maximo de 2 proximos ataques em buffer 
		if dashing
			currentState=states.DASH
		if hurt 
			currentState=states.HURT
		gravity()
		break
		
	case states.RUNTTACK:
		if image_index == 3 
			if alignment == "player"
				instance_create_layer(x+12*sign(image_xscale),y-30,"PlayerBladeHitbox",oHitbox)
		//hSpeed+=(.03*sign(-image_xscale))
		if sprite_index != sRunttack{
			image_index=0
			attacking=0
		}
		sprite_index = sRunttack
		if image_index>=image_number-1{
			currentState=states.IDLE
			combo=1
		}
		if dashing
			currentState=states.DASH
		if hurt 
			currentState=states.HURT
		accelDecel()
		gravity()
		break
		
	case states.AIRTTACK:
		if image_index == 3 
			if alignment == "player"
				instance_create_layer(x+12*sign(image_xscale),y-30,"PlayerBladeHitbox",oHitbox)
		if sprite_index != sAirttack
			image_index=0
		sprite_index = sAirttack
		if image_index>=image_number-1{
			image_index=image_number-1
			if vSpeed==0 and onFloor
				currentState=states.IDLE
		}
		if vSpeed==0 and onFloor{ //caso caia no chao antes de terminar o ataque:
			sprite_index = sAttack[0] //entre no estado attack a partir do mesmo indice de sprite
			currentState=states.ATTACK
		}
		attacking=0
		if dashing
			currentState=states.DASH
		if hurt 
			currentState=states.HURT
		flipToDirection()
		accelDecel()
		wallJump()
		gravity()
		break
		
	case states.SHOOTTACK:
		hSpeed=0
		if sprite_index != sShoot{
			image_index=0
		}
		sprite_index = sShoot
		shooting=0
		if image_index>=image_number-1
			currentState=states.IDLE
		if image_index==image_number-2
			instance_create_layer(
				x+(global.playerDir>=62 and (global.playerDir<=90))*10*-sign(image_xscale)
				+(global.playerDir>=270 and (global.playerDir<=308))*10*sign(image_xscale),
				y - 30,
				"Creatures",oBullet
			)
		if dashing
			currentState=states.DASH
		if hurt 
			currentState=states.HURT
		gravity()
		break
		
	case states.HURT:
		if object_index!=oPlayer selected=1
		if sprite_index != sHurt{
			image_index=0
			life -= hurt - hurt*def 
			lifeTillFaint -= hurt - hurt*def 
		}
		sprite_index = sHurt
		hurt=0
		if image_index>=image_number-1
			currentState=states.IDLE
		if shooting
			shooting=0
		if attacking
			attacking=0
		if image_index>=1 and onFloor hSpeed=0
		if lifeTillFaint<=0
			currentState=states.HURTFALL
		if life<=0{
			var corpse = instance_create_layer(x,y-10,"Creatures",oParts)
			corpse.owner=name
			corpse.variant=choose(0,1,2)
			corpse.part=0
			if object_index!=oPlayer{
				instance_destroy(self)
				exit
			}else{
				game_restart()
			}
		}
		gravity()
		break
		
	case states.HURTFALL:
		if sprite_index != sHurtFall
			image_index=0
		sprite_index = sHurtFall
		if image_index>=image_number-1{
			image_index=image_number-1
			if onFloor{
				faintTimer=0
				currentState=states.FAINT
			}
		}
		gravity()
		if onFloor hSpeed=0
		break
		
	case states.HURTFALLBACK:
		if sprite_index != sHurtFallBack
			image_index=0
		sprite_index = sHurtFallBack
		if image_index>=image_number-1{
			currentState=states.IDLE
		}
		gravity()
		break
		
	case states.FAINT:
		lifeTillFaint=10
		image_index=image_number-1
		if faintTimer>=15{
			hurt=0
			currentState=states.HURTFALLBACK
		}
		if shooting
			shooting=0
		if attacking
			attacking=0
		if onFloor 
			hSpeed=0
		faintTimer++
		gravity()
		break
}

wallCollision()
resetIfOut()
