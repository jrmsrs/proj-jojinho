if other.id!=oPlayer.id{
	other.selected=true
	other.showHealthTimer=0
	ds_list_add(global.selectedCreatures,other)
}
