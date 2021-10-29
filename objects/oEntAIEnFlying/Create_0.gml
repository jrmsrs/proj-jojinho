event_inherited();

aiFlyingStatesInit()

movSpeed=1.2
movSpeedChase=1.5

accel=0.15
decel=0.15
hSpeed=0
vSpeed=0
scale=image_xscale
scoutCounter=0
originX=x
originY=y

gravityForce = 0.5
vSpeedMax = 12

maxLife=10
life=maxLife
lifeTillFaint=5
def=.2
hurt=0
faintTimer=0

currentState=aiFlyingStates.SCOUT

maxChaseRange = 130
maxAlertChaseRange = 450
alert=false
dir=0

image_xscale=choose(image_xscale,-image_xscale)