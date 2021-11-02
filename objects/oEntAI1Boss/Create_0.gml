event_inherited();

aiFlyingStatesInit()

#region FIRST FORM (humanoid)
statesInit()

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
hAxisLock = 0
hAxisLockTimer = 10
walljumpForce = 0
idleTimer = 0

canJumpDelay=0

currentState = states.IDLE;
defaultScale = abs(image_xscale)

shooting=0
attacking=0
dashing=0
combo=0

maxLife=20
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

#endregion

alignment = "enemy"
name = "boss form 1"
form = "humanoid"

maxRange = 220
iaTimer = 0
distanceSensor = 0

alert=false

iaDelay=0

image_xscale=choose(image_xscale,-image_xscale)

defending=0
tiredTimer=0
tiredDelay=70
theresABullet=false

chasing=false

drawTimer=0