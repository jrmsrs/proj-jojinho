if !runOnce{
	switch owner{
		case "player":
			sprite_index=sPlayerParts
			image_xscale=1.5
			break
		case "demo":
			sprite_index=sDemoParts
			image_xscale=1.5
			break
		case "zomb":
			sprite_index=sZombParts
			image_xscale=2
			break
	}
	image_yscale=image_xscale

	if part == 0{
		image_index=0
		next = instance_create_layer(x+choose(1,-1),y+choose(1,-1),"Creatures",oParts)
		next.owner = owner
		next.part = 1
		next.variant = variant
		next.image_xscale=image_xscale
		next.image_yscale=image_yscale
	}

	if part == 1{
		switch variant{
			case 0:
				image_index=1
				break
			case 1:
				image_index=2
				next = instance_create_layer(x+choose(1,-1),y+choose(1,-1),"Creatures",oParts)
				next.owner = owner
				next.part = 2
				next.variant = variant
				next.image_xscale=image_xscale
				next.image_yscale=image_yscale
				break
			case 2:
				image_index=4
				next = instance_create_layer(x+choose(1,-1),y+choose(1,-1),"Creatures",oParts)
				next.owner = owner
				next.part = 2
				next.variant = variant
				next.image_xscale=image_xscale
				next.image_yscale=image_yscale
				break
		}
	} 

	if part == 2{
		switch variant{
			case 1:
				image_index=3
				break
			case 2:
				image_index=5
				break
		}
		
		//Special cases
		//Demo
		if owner=="demo"{
			if variant==0 or variant==2{
				next = instance_create_layer(x+choose(1,-1),y+choose(1,-1),"Creatures",oParts)
				next.owner = owner
				next.part = 3
				next.variant = variant
				next.image_xscale=image_xscale
				next.image_yscale=image_yscale
			}
		}
	}
	//Special cases
	if part == 3{
		image_index=6
		next = instance_create_layer(x+choose(1,-1),y+choose(1,-1),"Creatures",oParts)
		next.owner = owner
		next.part = 4
		next.variant = variant
		next.image_xscale=image_xscale
		next.image_yscale=image_yscale
	}
	if part == 4{
		image_index=7
	}
}

if runOnce++ >= 1
	runOnce=1
if timer++ >= 400
	image_alpha-=.005
if timer >= 600
	instance_destroy()
	
applyGravity()
wallCollision()

if place_meeting(x,y+6,oWall){
	y+=.01
	hSpeed=0
}
