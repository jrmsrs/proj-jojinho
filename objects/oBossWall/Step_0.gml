if distance_to_object(oPlayer)<=distanceMeter
	image_alpha=1-distance_to_object(oPlayer)/distanceMeter
else
	image_alpha=0
	
if place_meeting(x+5,y,oPlayer) or place_meeting(x-5,y,oPlayer)
	oPlayer.hSpeed = 5*sign(oPlayer.x-x)