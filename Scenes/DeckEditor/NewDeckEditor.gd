extends Control
var cardDB = preload("res://Card/CardDatabase.gd").new()

func _get_card_db():
	return cardDB
