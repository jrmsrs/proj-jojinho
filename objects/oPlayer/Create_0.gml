//parent values
event_inherited();

instance_create_layer(x,y,"Game",oCamera)

//individual specie values
walljumpForce=3
movSpeed=3
debug=1

dashLimiter=1

weapon1="Blade Wu"

//sprites
sIdleby = sPlayerIdleby
sIdle = sPlayerIdle
sAttack = [sPlayerAttack1,sPlayerAttack2,sPlayerAttack3]
sDash = sPlayerDash
sRun = sPlayerRun 
sRunttack = sPlayerRunttack
sAir = [sPlayerAirJump, sPlayerAirFall]
sAirttack = sPlayerAirttack
sHurt = sPlayerHurt
sHurtFall = sPlayerHurtFall
sHurtFallBack = sPlayerHurtFallBack

alpha=0
