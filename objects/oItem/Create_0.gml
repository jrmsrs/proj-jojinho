rotate=true
color=255
multiply=-1

switch itemName{

	case "Key":
		sprite_index=sIKeys
		rotate=false
		break

	//melee
	case "Blade Wu":
		sprite_index=sIAllBlades
		image_index=0
		rotate=false
		break
	case "Blade Draga":
		sprite_index=sIAllBlades
		image_index=1
		rotate=false
		break
	
	//ranged
	case "Gun Revla":
		sprite_index=sIAllGuns
		image_index=0
		break
	case "Gun Launcher":
		sprite_index=sIAllGuns
		image_index=1
		break

}

switch sprite_index{
	case sIAllBlades:
		itemType="weapon1"
	break
	case sIAllGuns:
		itemType="weapon2"
	break
	default:
		itemType="equip"
	break
}