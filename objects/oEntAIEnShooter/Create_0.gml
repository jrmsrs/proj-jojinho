event_inherited();

alignment = "enemy"

shootRange=200

maxRange = shootRange
iaTimer = 0
distanceSensor = 0

//alert=false

iaDelay=0

chase = function(){
	if distance_to_object(oPlayer) <= 30{
		hAxis = sign(oPlayer.x-x) 
		return true
	}
	return false
}