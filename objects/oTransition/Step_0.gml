rot-=.8

switch global.transitionState{
	case trans.READY:
		global.transitionState = trans.OUT
	break
	case trans.IN:
		image+=.2
		if image >= 10
			global.transitionState = trans.READY
	break
	case trans.OUT:
		image-=.2
		if image <= 0{
			global.transitionState = trans.NONE
			instance_destroy(self)
		}
	break
}
