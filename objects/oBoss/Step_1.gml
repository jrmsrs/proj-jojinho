event_inherited();

if name=="boss form 1"{
	name="boss"
	form="humanoid"
	maxLife=100
	life=maxLife
	lifeTillFaint=maxLife
	def=.2
	movSpeed = .5

	//sprites
	sIdleby = sBoss1Idle
	sIdle = sBoss1Idle
	sAttack = [sBoss1Attack,sBoss1Attack,sBoss1Attack]
	sDefend = sBoss1Defend
	sDash = sBoss1Idle
	sRun = sBoss1Run 
	sRunttack = sBoss1Idle
	sAir = [sBoss1Idle, sBoss1Idle]
	sAirttack = sBoss1Idle
	sHurt = sBoss1Hurt
	sHurtFall = sBoss1Hurt
	sHurtFallBack = sBoss1Hurt
	sTired = sBoss1Tired
}

if name=="boss form 2"{
	name="boss"
	form="flying"
	lifeTillFaint=15
	movSpeed = 2
	chasing=true

	currentState=aiFlyingStates.CHASE

	//sprites
	sAttack = sBoss2Attack
	sChase = sBoss2Scout
	sScout = sBoss2Scout
	sHurt = sBoss2Hurt
	sHurtFall = sBoss2HurtFall
	sHurtFallBack = sBoss2HurtFallBack
	
}
