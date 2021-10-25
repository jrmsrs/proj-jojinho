saveGame=false
loadGame=false
//methods
save = function(slot="gs1"){
	ini_open("save.s")

	var invWeapon1_stringify = ds_list_write(global.inventoryWeapon1)
	var invWeapon2_stringify = ds_list_write(global.inventoryWeapon2)
	var invEquip_stringify = ds_list_write(global.inventoryEquip)

	ini_write_string(slot,"cp",global.checkPoint)
	if ds_list_size(global.inventoryWeapon1)>0
		ini_write_string(slot,"invw1",invWeapon1_stringify)
	else
		ini_key_delete(slot,"invw1")
	if ds_list_size(global.inventoryWeapon2)>0
		ini_write_string(slot,"invw2",invWeapon2_stringify)
	else
		ini_key_delete(slot,"invw2")
	if ds_list_size(global.inventoryEquip)>0
		ini_write_string(slot,"inveq",invEquip_stringify)
	else
		ini_key_delete(slot,"inveq")

	ini_close()
}
load = function(slot="gs1"){
	ini_open("save.s")

	var invWeapon1_stringify = ini_read_string(slot, "invw1", "")
	var invWeapon2_stringify = ini_read_string(slot, "invw2", "")
	var invEquip_stringify = ini_read_string(slot, "inveq", "")

	ds_list_clear(global.inventoryWeapon1)
	ds_list_clear(global.inventoryWeapon2)
	ds_list_clear(global.inventoryEquip)

	global.checkPoint = ini_read_string(slot,"cp","0")
	if invWeapon1_stringify != "" {
		ds_list_read(global.inventoryWeapon1, invWeapon1_stringify)
		oPlayer.weapon1 = ds_list_find_value(global.inventoryWeapon1,0)
	}
	if invWeapon2_stringify != "" { 
		ds_list_read(global.inventoryWeapon2, invWeapon2_stringify)
		oPlayer.weapon2 = ds_list_find_value(global.inventoryWeapon2,0)
	}
	if invEquip_stringify != "" {
		ds_list_read(global.inventoryEquip, invEquip_stringify)
	}

	ini_close();
}
