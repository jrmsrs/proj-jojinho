if rotate image_angle++

image_blend = make_color_rgb(color,color,color)

color+=.5*multiply

if color<=200
	multiply = 1
if color>=255
	multiply = -1
	
//verifica se o item ja está no inventario
switch itemType{
	case "weapon1":
		if ds_list_find_index(global.inventoryWeapon1,itemName)>-1
			instance_destroy(self)
	break
	case "weapon2":
		if ds_list_find_index(global.inventoryWeapon2,itemName)>-1
			instance_destroy(self)
	break
	case "equip":
		if ds_list_find_index(global.inventoryEquip,itemName)>-1
			instance_destroy(self)
	break
}

if !levitate{
	applyGravity()
	wallCollision()
	if place_meeting(x,y+1,oWall)
		hSpeed=0
}
