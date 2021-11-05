event_inherited();
if !object_exists(oPlayer) exit

#region STATIC FORM
if form=="static"{
	instance_deactivate_object(oBossWall)
	if distance_to_object(oPlayer)<=200{
		name = "boss form 1"
		instance_activate_object(oBossWall)
	}
	hurt=0
}
#endregion

#region INHERIT HUMANOID (it's not AI)
if form=="humanoid"{
	onFloor = place_meeting(x,y+6,oWall) or place_meeting(x,y+6,oBox)
	onWall = place_meeting(x+1,y,oWall) or place_meeting(x-1,y,oWall)

	if hAxisLock{
		if hAxisLockTimer--<=0{
			hAxisLock=false
			hAxisLockTimer=10
		}
	} else {
		hAxisLockTimer=10
	}

	if onFloor{ 
		canJumpDelay=0 
		if hAxisLock 
			hAxisLock=false
	}
	else canJumpDelay++

	if onWall{
		if hAxisLock
			hAxisLock=false
	}


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
			applyGravity()
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
			applyGravity()
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
			applyGravity()
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
			if place_meeting(x+hAxis,y,oWall) and vSpeed>0 and alignment=="player"
				currentState=states.WALLSLIDE
			if hurt 
				currentState=states.HURT
			if shooting
				shooting=0
			if image_index>=image_number-1
				image_index=image_number-1
			flipToDirection()
			if !hAxisLock accelDecel()
			jump()
			wallJump()
			applyGravity()
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
				attacking=0
				tiredTimer=0
				currentState=states.TIRED
			}
		
			if attacking>=2
				attacking=2 //guarda um maximo de 2 proximos ataques em buffer 
			if dashing
				currentState=states.DASH
			if hurt 
				currentState=states.HURT
			applyGravity()
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
			applyGravity()
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
			applyGravity()
			break
		
		case states.SHOOTTACK:
	
			if instance_exists(oBomb) and alignment=="player"{
				sprite_index=sIdle
				currentState=states.IDLE
				exit
			}
		
			hSpeed=0
			if sprite_index != sShoot{
				image_index=0
			}
			sprite_index = sShoot
			shooting=0
		
			if alignment=="player"{
				if image_index==image_number-1{
					if weapon2=="Gun Revla"{
						instance_create_layer(
							x+(global.playerDir>=62 and (global.playerDir<=90))*10*-sign(image_xscale)
							+(global.playerDir>=270 and (global.playerDir<=308))*10*sign(image_xscale),
							y - 30,
							"Creatures",oBullet
						)
					}
					if weapon2=="Gun Launcher"{
						if global.playerDir<=270 and global.playerDir>=90 and image_xscale<0 or
						   !(global.playerDir<270 and global.playerDir>90) and image_xscale>0 { 
							instance_create_layer(
								x+lengthdir_x(50, global.playerDir),
								y+lengthdir_y(50, global.playerDir) - 25,
								"Creatures",oBomb
							)
						}
						else
							instance_create_layer(
								x+50*sign(image_xscale),
								y - 25,
								"Creatures",oBomb
							)
					}
				}
			}
			if image_index>=image_number-1
				currentState=states.IDLE
			if dashing
				currentState=states.DASH
			if hurt 
				currentState=states.HURT
			applyGravity()
			break
		
		case states.WALLSLIDE:
			var canSlide = instance_nearest(x,y,oWall).canSlide
			if alignment != "player" or !canSlide {
				currentState=states.AIR
				exit
			}
			if sprite_index != sPlayerWallSlide{
				image_index=0
				sprite_index=sPlayerWallSlide
			}
			if (vSpeed==0 and onFloor) or !onWall
				currentState=states.IDLE
			if attacking
				currentState=states.AIRTTACK
			if dashing
				currentState=states.DASH
			if hurt 
				currentState=states.HURT
			if shooting
				shooting=0
			flipToDirection(true)//reverse
			accelDecel()
			wallJump()
			applyGravity(.1,1)
			break
		
		case states.HURT:
			if object_index!=oPlayer selected=1
			if sprite_index != sHurt{
				shakeScreen(3)
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
				currentState=states.DEAD
			}
			applyGravity()
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
			applyGravity()
			if onFloor hSpeed=0
			break
		
		case states.HURTFALLBACK:
			if sprite_index != sHurtFallBack
				image_index=0
			sprite_index = sHurtFallBack
			if image_index>=image_number-1{
				currentState=states.IDLE
			}
			applyGravity()
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
			applyGravity()
			break
		
		case states.DEAD:
			instance_destroy()
			break
	
	}

	ifOut()
	if alignment=="player" 
		boxCollision()
	wallCollision()
}
#endregion 

#region FLYING FORM (it's AI)
if form=="flying"{
	invincible = currentState==aiFlyingStates.FAINT or currentState==aiFlyingStates.HURT or currentState==aiFlyingStates.HURTFALL or currentState==aiFlyingStates.HURTFALLBACK
	onFloor = place_meeting(x,y+6,oWall)
	if invincible and !currentState==aiFlyingStates.HURT hurt=0
	var dirToPlayer = point_direction(x,y,oPlayer.x,oPlayer.y)

	switch currentState{
		case aiFlyingStates.CHASE:
			sprite_index=sChase
			if chasing{
				if x-oPlayer.x>8 or x-oPlayer.x<-8
					hSpeed = lengthdir_x(movSpeed, dirToPlayer)
				if y-oPlayer.y>8 or y-oPlayer.y<-8
					vSpeed = lengthdir_y(movSpeed, dirToPlayer)
			}else{
				if !place_meeting(x+sign(hSpeed),y,oWall) 
					hSpeed = lengthdir_x(movSpeed, -dirToPlayer)
				else 
					hSpeed = lengthdir_x(movSpeed, dirToPlayer)
					
				if !place_meeting(y+sign(hSpeed),y,oWall) 
					vSpeed = -abs(lengthdir_y(movSpeed, -dirToPlayer))
				else 
					vSpeed = 0
			}
			if attacking
				currentState=aiFlyingStates.ATTACK
			if hurt 
				currentState=aiFlyingStates.HURT
			if hSpeed!=0 
				image_xscale = sign(hSpeed)*defaultScale
			x+=hSpeed; y+=vSpeed
			break
			
		case aiFlyingStates.ATTACK:
			if chasing{
				if x-oPlayer.x>8 or x-oPlayer.x<-8
					hSpeed = lengthdir_x(movSpeed, dirToPlayer)
				if y-oPlayer.y>8 or y-oPlayer.y<-8
					vSpeed = lengthdir_y(movSpeed, dirToPlayer)
			}
			if sprite_index != sAttack{
				sprite_index = sAttack
				image_index=0
			}
			
			if image_index>=image_number-1{
				currentState=aiFlyingStates.CHASE
				attacking=0
			}
				
			if x-oPlayer.x>8 or x-oPlayer.x<-8
				hSpeed = lengthdir_x(movSpeed, dirToPlayer)
			if y-oPlayer.y>8 or y-oPlayer.y<-8
				vSpeed = lengthdir_y(movSpeed, dirToPlayer)
			if !layer_exists("BossHitbox")
				layer_create(depth,"BossHitbox")
	
			instance_create_layer(x,y+3*image_yscale,"BossHitbox",oHitbox)

			if instance_exists(oBullet)
				if distance_to_object(oBullet)<=20{
					instance_destroy(oBullet)
				}
			x+=hSpeed; y+=vSpeed
			break
		
		case aiFlyingStates.HURT:
			selected=1
			if sprite_index != sHurt{
				sprite_index = sHurt
				image_index=0
				//if alert{
					hSpeed=0; vSpeed=0
				//}	
				life -= hurt - hurt*def 
				lifeTillFaint -= hurt - hurt*def 
				shakeScreen(3)
			}
			//alert=true
			hurt=0
			if image_index>=image_number-1
				currentState=aiFlyingStates.CHASE
			if lifeTillFaint<=0
				currentState=aiFlyingStates.HURTFALL
			if life<=0{
				var corpse = instance_create_layer(x,y-10,"Creatures",oParts)
				corpse.owner=name
				corpse.variant=choose(0,1,2)
				corpse.part=0
				instance_destroy(self)
			}
			break
		
		case aiFlyingStates.HURTFALL:
			hurt=0
			if sprite_index != sHurtFall{
				image_index=0
			}	
			sprite_index=sHurtFall
		
			if image_index>=image_number-3{
				image_index=4
			}
			if onFloor{
				faintTimer=0
				currentState=aiFlyingStates.FAINT
			}
			hSpeed = lerp(hSpeed,0,accel)
			applyGravity()
			wallCollision()
			break
		
		case aiFlyingStates.FAINT:
			lifeTillFaint=10
			if image_index>=image_number-1
				image_index=image_number-1
			if faintTimer>=15
				hurt=0
				currentState=aiFlyingStates.HURTFALLBACK
			faintTimer++
			hSpeed = lerp(hSpeed,0,accel)
			applyGravity()
			wallCollision()
			break
	
		case aiFlyingStates.HURTFALLBACK:
			if sprite_index != sHurtFallBack
				image_index=0
			sprite_index = sHurtFallBack
			if image_index>=image_number-1
				currentState=aiFlyingStates.CHASE
			applyGravity()
			wallCollision()
			break
	}
}
#endregion

function chase(){
	if !oPlayer.invincible 
		hAxis = sign(oPlayer.x-x) 
	else 
		hAxis = -sign(oPlayer.x-x)

	if alert or (distance_to_object(oPlayer) <= 38 and distance_to_object(oPlayer) > 15){
		if oPlayer.invincible 
			return false
		return true
	}
	if place_meeting(x+(distanceSensor*sign(image_xscale)),y,oPlayer){
		return true
	}
	if distanceSensor>=maxRange 
		distanceSensor=0
	distanceSensor+=3
	return false
}

switch form{
	case "humanoid":
		switch(currentState){
			case states.IDLE:
				if sprite_index!=sIdle and sprite_index!=sHurt and sprite_index!=sHurtFallBack
					alert=false
				hAxis=0
		
				if defending
					currentState=states.DEFEND
			
				if iaTimer++ >= iaDelay or chase() or alert{
					iaTimer=0
					iaDelay=choose(50,100,150)
					currentState = states.RUN
					if !oPlayer.invincible hAxis=sign(image_xscale)
					else hAxis=-sign(image_xscale)
				}
				if distance_to_object(oPlayer) <= 40 and sign(oPlayer.x-x)==sign(image_xscale) and !oPlayer.invincible{
					hAxis=0
					attacking=1
				}
				break
		
			case states.RUN:
				if defending
					currentState=states.DEFEND
			
				if iaTimer++ >= 200{
					iaTimer=0
					currentState = states.IDLE
					hAxis=0
					break
				}
		
				hAxis=sign(image_xscale)
	
				//se não houver um chão adiante ou se houver uma parede, inverta a direcao
				if (!place_meeting(x+sign(image_xscale)*16,y+6,oWall) or place_meeting(x+sign(image_xscale)*4,y,oWall)) and onFloor{
					hAxis = -hAxis
					alert=false
				}
		
				if chase()
					iaTimer=0 //temporizador zera enquanto está perseguindo
		
				if distance_to_object(oPlayer)<=30 and !oPlayer.invincible {
					hAxis=0
					currentState = states.IDLE
				}
				break
		
			case states.ATTACK:
				if defending
					currentState=states.DEFEND
				if !layer_exists("BossHitbox")
					layer_create(depth,"BossHitbox")
	
				instance_create_layer(x,y+3*image_yscale,"BossHitbox",oHitbox)

				if instance_exists(oBullet)
					if distance_to_object(oBullet)<=20{
						instance_destroy(oBullet)
					}
				if !instance_exists(oBullet) and theresABullet{
					if image_index>=3{
						currentState=states.IDLE
						attacking=false
						theresABullet=false
					}
				}	
				break
	
			case states.RUNTTACK:
				//sempre vai travar o movimento quando ataca
				if defending
					currentState=states.DEFEND
				currentState=states.ATTACK
				break
		
			case states.DEFEND:
				hSpeed=1*-sign(image_xscale)
				if sprite_index != sDefend{
					sprite_index = sDefend
					image_index=0
					defending=0
				}
				shakeScreen(5)
				if image_index>=image_number-1
					currentState=states.IDLE
				break
			
			case states.TIRED:
				hSpeed=0
				if sprite_index != sTired{
					sprite_index = sTired
					image_index=0
				}
				if hurt 
					currentState=states.HURT
				if tiredTimer++ >= tiredDelay{
					currentState=states.IDLE
					tiredTimer=0
				}
				break
		
			case states.HURT:
				hAxis = sign(oPlayer.x-x) 
				image_xscale=defaultScale*hAxis
				if tiredTimer>0{
					if image_index>=image_number-1{
						currentState=states.TIRED
					}
				}
				if life<=0{
					//die in form 2 state
					form="boss form 2"
				}
				break
		
			case -1:
				hurt=0
				hSpeed=0
				if sprite_index != sBossTransform{
					sprite_index = sBossTransform
					image_index=0
				}
				if image_index>=image_number-1{
					name="boss form 2"
					instance_deactivate_object(instance_nearest(240,384,oBossWall))
					instance_deactivate_object(instance_nearest(624,384,oBossWall))
				}
				break
		}
		if oPlayer.currentState==states.ATTACK and distance_to_object(oPlayer) <= 50
			defending=1
		else
			defending=0
		
		if instance_exists(oBullet) {
			if distance_to_object(oBullet) <= 50{
				attacking=true
				theresABullet=true
			}
		}
		if life>maxLife*.75{ //state 1: Boss1, but slow (slower image_speed when running)
			if currentState=states.RUN
				image_speed=.5
			else
				image_speed=1
		}else if life<=maxLife*.75 and life>=maxLife*.5{ //state 1.5: Boss1, but faster (normal image_speed)
			movSpeed=1
		}else{ //state 1.999: Boss2, transform into flying form
			currentState=-1
		}
		
		break
		
	case "flying":
		switch currentState{
			case aiFlyingStates.CHASE:
				if chasing and distance_to_object(oPlayer)<=30
					attacking=1
				break
		}
		
		if oPlayer.invincible
				chasing=false
			else 
				chasing=true
		break
}
	