if other.currentState != states.FAINT 
and other.currentState != states.HURTFALL 
and currentState != states.DASH
	hSpeed += sign(x-other.x)