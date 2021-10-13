if keySetW1{
	if ds_list_size(global.inventoryWeapon1)>1{ 
		selWeapon1++
		weapon1=ds_list_find_value(global.inventoryWeapon1,(selWeapon1)%2)
	}
}
if keySetW2{
	if ds_list_size(global.inventoryWeapon2)>1{ 
		selWeapon2++
		weapon2=ds_list_find_value(global.inventoryWeapon1,selWeapon2%1)
	}
}