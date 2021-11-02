event_inherited();

if name!="boss form 1"{
	name="boss form 1"
	maxLife=20
	life=maxLife
	lifeTillFaint=maxLife
	def=.3
	movSpeed = 1

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