event_inherited();

statesInit()

alignment = "player"
name = "creature"

hSpeed = 0
vSpeed = 0
vSpeedMax = 12
accel = 0.15
decel = 0.15
movSpeed = 1.5
jumpHeight = 9
gravityForce = 0.5
jumpPressTimeMax = 5
jumpPressTime = 0
accelAir = 0.08
decelAir = 0.08
hAxis = 0
walljumpForce = 0
idleTimer = 0

currentState = states.IDLE;
defaultScale = image_xscale

shooting=0
attacking=0
dashing=0
combo=0

maxLife=10
life=maxLife
lifeTillFaint=10
def=.2
hurt=0
faintTimer=0

//default: player sprites
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

//showHealthTimer=0