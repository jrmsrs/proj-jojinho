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

cursor=0
cursorMoved=false
initialPlayerDir=1
global.playerDir=0
global.selectedCreatures=ds_list_create()
global.lockTarget=noone
shootDir=0
lockCursor=false