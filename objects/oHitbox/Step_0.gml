if layer==layer_get_id("PlayerBladeHitbox"){
	if frames>=0{
		image_yscale=.3
		image_angle=-70*dir
	}
	if frames>=1{
		image_yscale=.4
		image_angle=-130*dir
	}
} else if layer==layer_get_id("EnemyHitbox"){
	if frames>=0{
		image_yscale=.3
		image_angle=-70*dir
	}
	if frames>=1{
		image_yscale=.4
		image_angle=-130*dir
	}
}


if frames>=2 instance_destroy(self)

frames++

