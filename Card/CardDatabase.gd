var cards = {
	"Blaster Blade" :  "res://Assets/Textures/1.jpg",
	"Goddess of Mercy, Inanna" : "res://Assets/Textures/4.jpg",
	"Dragheart, Luard" : "res://Assets/Textures/2.png",
	"Dragonic Overlord" : "res://Assets/Textures/3.png",
	"Seeker, Sacred Wingal" : "res://Assets/Textures/8.jpg",
	"Illusionary Revenger, Mordred Phantom" : "res://Assets/Textures/5.png",
	"Lucky Rise, Elprina" : "res://Assets/Textures/7.jpg",
	"Dragonic Blademaster" : "res://Assets/Textures/6.png"
}

func get_texture_path(name):
		if cards.has(name):
			return cards.get(name)
		else:
			return "res://Assets/Textures/cardBack.jpg"
		
