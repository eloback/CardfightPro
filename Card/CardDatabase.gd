
func get_texture_path(name):
	match name:
		"seeker, sacred wingal":
			return "res://Assets/Textures/1.jpg"
		"1":
			return "res://Assets/Textures/4.jpg"
		"2":
			return "res://Assets/Textures/2.png"
		"3":
			return "res://Assets/Textures/3.png"
		"4":
			return "res://Assets/Textures/8.jpg"
		"5":
			return "res://Assets/Textures/5.png"
		"6":
			return "res://Assets/Textures/7.jpg"
		"7":
			return "res://Assets/Textures/6.png"
	return "res://Assets/Textures/CardBack.jpg" # Default card
