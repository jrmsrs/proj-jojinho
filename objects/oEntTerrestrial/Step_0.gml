onFloor = place_meeting(x,y+6,oWall)
running = hSpeed!=0
jumping = vSpeed<0 or (vSpeed==0 and !onFloor)
falling = vSpeed>0

//STATE MACHINE
enumInit()

switch currentState {
    case states.normal: normalState(); break
    case states.attack: attackState(); break
}

swapSprite()

resetIfOut()