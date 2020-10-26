extends Node
var Card = preload("res://Card/Card.gd")
var cardDatabase = preload("res://Card/CardDatabase.gd").new()

var ip
var deck = {"Blaster Blade": 2}
var enemy_deck = {"Seeker, Sacred Wingal": 3}

func get_texture_path(name):
		if cardDatabase.cards.has(name): # tem chave <name>
			return cardDatabase.cards.get(name) # get valor de chave <name>
		else:
			return "res://Assets/Textures/cardBack.jpg"
