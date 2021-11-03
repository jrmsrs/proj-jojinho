switch itemName{

	case "Key Lab":
		ds_list_add(global.inventoryEquip,itemName)
		break

	case "Blade Wu":
		shakeScreen(30)
	case "Blade Draga":
		ds_list_add(global.inventoryWeapon1,itemName)
		other.weapon1=itemName
		other.attacking=1
		break

	case "Gun Revla":
	case "Gun Launcher":
		ds_list_add(global.inventoryWeapon2,itemName)
		other.weapon2=itemName
		other.shooting=1
		break
	
	case "Life Heart 3": other.life+=15
	case "Life Heart 2": other.life+=10
	case "Life Heart 1": other.life+=5
		break
}

instance_destroy()
