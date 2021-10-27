switch dir{
	case "horizontal":
		view_xport[0] = random_range(-force, force)
		break
	case "vertical":
		view_yport[0] = random_range(-force, force)
		break
	default:
		view_xport[0] = random_range(-force, force)
		view_yport[0] = random_range(-force, force)
		break
}

force *= .95

if force<=.1{
	instance_destroy()
}
