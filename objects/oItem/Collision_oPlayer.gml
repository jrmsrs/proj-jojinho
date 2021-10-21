switch itemName{

	case "Key":
		break

	case "Blade Wu":
	case "Blade Draga":
		ds_list_add(global.inventoryWeapon1,itemName)
		other.weapon1=itemName
		other.attacking=1
		break

	case "Gun Revla":
		ds_list_add(global.inventoryWeapon2,itemName)
		other.weapon2=itemName
		other.shooting=1
		break
}

instance_destroy()
