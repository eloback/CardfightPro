var cards = [
	"Blaster Blade",
	"Goddess of Mercy, Inanna",
	"Dragheart, Luard",
	"Dragonic Overlord",
	"Seeker, Sacred Wingal",
	"Illusionary Revenger, Mordred Phantom",
	"Lucky Rise, Elprina",
	"Dragonic Blademaster"
]

func get_texture_path(name):
	match name:
		"Blaster Blade":
			return "res://Assets/Textures/1.jpg"
		"Goddess of Mercy, Inanna":
			return "res://Assets/Textures/4.jpg"
		"Dragheart, Luard":
			return "res://Assets/Textures/2.png"
		"Dragonic Overlord":
			return "res://Assets/Textures/3.png"
		"Seeker, Sacred Wingal":
			return "res://Assets/Textures/8.jpg"
		"Illusionary Revenger, Mordred Phantom":
			return "res://Assets/Textures/5.png"
		"Lucky Rise, Elprina":
			return "res://Assets/Textures/7.jpg"
		"Dragonic Blademaster":
			return "res://Assets/Textures/6.png"
		_:
			return "res://Assets/Textures/cardBack.jpg"
		
