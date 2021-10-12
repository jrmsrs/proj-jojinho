//parent values
event_inherited();

alignment = "player"
name="player"

instance_create_layer(x,y,"Game",oCamera)

//individual specie values
walljumpForce=3
movSpeed=3
//debug=0

dashLimiter=1

weapon1="Blade Wu"
weapon2="Gun Revla"

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

cursor=0
cursorMoved=false
global.playerDir=0
shootDir=0