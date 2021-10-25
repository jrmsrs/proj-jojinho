rotate=true
color=255
multiply=-1

switch itemName{

	case "Key":
		sprite_index=sIKeys
		rotate=false
		break

	case "Blade Wu":
		sprite_index=sIAllBlades
		rotate=false
		break
	case "Blade Draga":
		sprite_index=sIAllBlades
		image_index=1
		rotate=false
		break

	case "Gun Revla":
		sprite_index=sIAllGuns
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