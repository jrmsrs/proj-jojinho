//Initialize inventory
global.inventoryWeapon1 = ds_list_create();
global.inventoryWeapon2 = ds_list_create();
global.inventoryEquip = ds_list_create();
//Initial items
ds_list_add(global.inventoryWeapon1,"Blade Wu","Blade Draga")
ds_list_add(global.inventoryWeapon2,"Gun Revla")

hasItem = [
	ds_list_size(global.inventoryWeapon1)>0,
	ds_list_size(global.inventoryWeapon2)>0,
	ds_list_size(global.inventoryEquip)>0
]

global.totItemTypes = hasItem[0]+hasItem[1]+hasItem[2]