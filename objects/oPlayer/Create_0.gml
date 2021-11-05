invincible=false

//parent values
event_inherited();

alignment = "player"
name="player"

//individual specie values
walljumpForce=8
movSpeed=3.5
jumpHeight=10.5

dashLimiter=1

inventoryTurnOn=false
inventoryTimer=0
weapon1=noone
selWeapon1=1
weapon2=noone
selWeapon2=1

//sprites
sIdleby = sPlayerIdleby
sIdle = sPlayerIdle
sAttack = [sPlayerAttack1,sPlayerAttack2,sPlayerAttack3]
sShoot = sPlayerShoot
sDash = sPlayerDash
sRun = sPlayerRun 
sRunttack = sPlayerRunttack
sAir = [sPlayerAirJump, sPlayerAirFall]
sAirttack = sPlayerAirttack
sHurt = sPlayerHurt
sHurtFall = sPlayerHurtFall
sHurtFallBack = sPlayerHurtFallBack

alpha=0

life=30
maxLife=life

global.invertWeapon=false

global.checkPoint="0"

cursor=0
cursorMoved=false
initialPlayerDir=1
global.playerDir=0
global.selectedCreatures=ds_list_create()
global.lockTarget=noone
shootDir=0
lockCursor=false

keyInit()
kbDash = false
KbDash_maxDelay = 20
kbDash_timerOn = false
kbDash_timer = 0

//methods
drawInventory = function(n, quantityItems, yPos=70, scale=4, balloonStretchW=0, balloonStretchH=0, itemFrameSize=0, sel=[oPlayer.weapon1,oPlayer.weapon2]){
	balloonStretchW=12*scale
	balloonStretchH=26*scale
	itemFrameSize=9*scale
	
	//draw balloon arrow
	draw_sprite_ext(sInventory,2,x,y-yPos,2,2,0,c_white,1)
	//draw balloon stretchable width (varia com a quantidade de TIPOS de itens selecionaveis (n) )
	draw_sprite_stretched(sInventory,1,x-(balloonStretchW/2)*n,y-yPos-balloonStretchH,balloonStretchW*n,balloonStretchH)
	//draw balloon lateral borders
	draw_sprite_ext(sInventory,0,x-(balloonStretchW/2)*n,y-yPos-balloonStretchH,scale,scale,0,c_white,1)
	draw_sprite_ext(sInventory,0,x+(balloonStretchW/2)*n,y-yPos-balloonStretchH,scale,scale,0,c_white,1)
	//draw scroll bg and scroll
	for (i=0;i<n;i++){
		draw_sprite_ext(sInventory,3,x-(balloonStretchW/2)*n+(balloonStretchW*i),y-yPos-balloonStretchH,scale,scale,0,c_white,1)
		for (j=0;j<quantityItems[i];j++){
			draw_sprite_ext(sInventory, 5, x-(balloonStretchW/2)*n+(balloonStretchW*i), y-yPos-balloonStretchH+itemFrameSize*j, scale,scale,0,$E9E9E9,1)
		}
	}
	
	for (i=0;i<n;i++){
		for (j=0;j<quantityItems[i];j++){
			if i==0 
				switch ds_list_find_value(global.inventoryWeapon1,j){
					case "Blade Wu":
						if sel[i]="Blade Wu"
							draw_sprite_ext(sISelect, 0, x-(balloonStretchW/2)*n+(balloonStretchW*i), y-yPos-balloonStretchH+itemFrameSize*j, scale/4,scale/4,0,c_white,1)
						draw_sprite_ext(sIAllBlades, 0, (x-(balloonStretchW/2)*n+(balloonStretchW*i))+29, (y-yPos-balloonStretchH+itemFrameSize*j)+30, scale/4,scale/4,0,c_white,1)
						break
					case "Blade Draga":
						if sel[i]="Blade Draga"
							draw_sprite_ext(sISelect, 0, x-(balloonStretchW/2)*n+(balloonStretchW*i), y-yPos-balloonStretchH+itemFrameSize*j, scale/4,scale/4,0,c_white,1)
						draw_sprite_ext(sIAllBlades, 1, (x-(balloonStretchW/2)*n+(balloonStretchW*i))+29, (y-yPos-balloonStretchH+itemFrameSize*j)+30, scale/4,scale/4,0,c_white,1)
						break
				}
			if i==1
				switch ds_list_find_value(global.inventoryWeapon2,j){
					case "Gun Revla":
						if sel[i]="Gun Revla"
							draw_sprite_ext(sISelect, 0, x-(balloonStretchW/2)*n+(balloonStretchW*i), y-yPos-balloonStretchH+itemFrameSize*j, scale/4,scale/4,0,c_white,1)
						draw_sprite_ext(sIAllGuns, 0, (x-(balloonStretchW/2)*n+(balloonStretchW*i))+29, (y-yPos-balloonStretchH+itemFrameSize*j)+30, scale/4,scale/4,0,c_white,1)
						break
					case "Gun Launcher":
						if sel[i]="Gun Launcher"
							draw_sprite_ext(sISelect, 0, x-(balloonStretchW/2)*n+(balloonStretchW*i), y-yPos-balloonStretchH+itemFrameSize*j, scale/4,scale/4,0,c_white,1)
						draw_sprite_ext(sIAllGuns, 1, (x-(balloonStretchW/2)*n+(balloonStretchW*i))+29, (y-yPos-balloonStretchH+itemFrameSize*j)+30, scale/4,scale/4,0,c_white,1)
						break
					
				}
			if i==2
				switch ds_list_find_value(global.inventoryEquip,j){
					case "Key Lab":
						draw_sprite_ext(sIAllItems, 0, (x-(balloonStretchW/2)*n+(balloonStretchW*i))+29, (y-yPos-balloonStretchH+itemFrameSize*j)+30, scale/4,scale/4,0,c_white,1)
						break
				}
		}
	}

}

startPosition = function(){
	life=maxLife
	currentState=states.IDLE
	vSpeed = 0
	hSpeed = 0
	persistent=true
	switch global.checkPoint{
		case "0":
			room_goto(rAreaA1)
			break
		case "A":
			room_goto(rAreaAC)
			break
		case "B":
			room_goto(rAreaBC)
			break
	}
	if global.checkPoint=="0"{
		x = xstart
		y = ystart
	}else{
		x = 456
		y = 336
	}
}

kbDashDelay=function(key){
	//keyboard dash when double press right/left
	if kbDash_timerOn {
		kbDash = key
		if kbDash_timer++ >= KbDash_maxDelay{
			kbDash_timer=0
			kbDash_timerOn = false
		}
	}
	if key 
		kbDash_timerOn = true
	return kbDash
}
	
boxCollision=function(){
	if place_meeting(x+hSpeed,y,oBox) {
	    //while(!place_meeting(x+sign(hSpeed),y,oBox))
		//	x+=sign(hSpeed)
	    hSpeed = 0
	}
	//Collision top/down and apply force
	if place_meeting(x,y+vSpeed,oBox) {
	    //while(!place_meeting(x,y+sign(vSpeed),oBox)) 
		//	y+=sign(vSpeed)
	    vSpeed = 0
	}
}
