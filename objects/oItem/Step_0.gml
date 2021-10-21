if rotate image_angle++

image_blend = make_color_rgb(color,color,color)

color+=.5*multiply

if color<=200
	multiply = 1
if color>=255
	multiply = -1