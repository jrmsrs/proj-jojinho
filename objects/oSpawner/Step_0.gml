switch(currentState){
	case "wait":
		sprite_index=sChaserEnSpawnWaiting
		if timer>delay 
			timer=delay
		if timer++ >= delay and active {
			currentState="intro"
			timer=0
		}
		break
		
	case "intro": 
		if sprite_index!=sChaserEnSpawnCreating{
			image_index=0
			sprite_index=sChaserEnSpawnCreating
		}
		if image_index>=8{
			var n = irandom(array_length(groupNames)-1)
			currentName = array_get(groupNames,n)
			currentState="ready"
		}
		break
		
	case "ready":
		if image_xscale<2 image_xscale+=.05 
		if sprite_index==sChaserEnSpawnCreating{
			image_index=0
			switch currentName {
				case "demo": 
					sprite_index=sDemoBorn
					currentObj=oDemo
					break
				case "sniper": 
					sprite_index=sSniperBorn
					currentObj=oSniper
					break
				case "zomb": 
				default:
					sprite_index=sZombBorn
					currentObj=oZomb
					break
			}
		}
		if image_index>=image_number-1{
			if ds_list_size(enemies) < maxInsts{
				var en = instance_create_layer(x,y,layer,currentObj)
				en.defaultScale = currentObj==oZomb ? 2:3
				en.image_xscale=en.defaultScale//*sign(oPlayer.x-en.x)
				en.image_yscale=en.defaultScale
				//en.hSpeed = sign(oPlayer.x-en.x)*en.movSpeed
				en.fullChase = true
				ds_list_add(enemies,en)
				currentState="outro"
			}else{
				image_index=image_number-1
			}
		}
		break
		
	case "outro":
		image_xscale=defaultScale
		if sprite_index!=sChaserEnSpawnCreating{
			image_index=9
			sprite_index=sChaserEnSpawnCreating
		}
		if image_index>=image_number-1{
			currentState="wait"
		}
		break
	
}

for (i=0; i<ds_list_size(enemies); i++){
	if !instance_exists(ds_list_find_value(enemies,i)){
		ds_list_delete(enemies,i)
	}
}

image_yscale=image_xscale
