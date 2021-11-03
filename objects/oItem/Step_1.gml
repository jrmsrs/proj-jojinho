if postCreation{
	postCreation=false
	switch itemName{
	
		//autoconsumable
		case "Life Heart 1":
			sprite_index=sILifeHeart
			image_xscale=defaultScale*0.50
			image_yscale=image_xscale
			rotate=false
			break
		case "Life Heart 2":
			sprite_index=sILifeHeart
			image_xscale=defaultScale*0.75
			image_yscale=image_xscale
			rotate=false
			break
		case "Life Heart 3":
			sprite_index=sILifeHeart
			image_xscale=defaultScale*1.00
			image_yscale=image_xscale
			rotate=false
			break
	}
}