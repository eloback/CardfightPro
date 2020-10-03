extends Control
var cardDB = preload("res://Card/CardDatabase.gd").new()

func _get_card_db():
	return cardDB

func add_card_to_deck(card):
	$DeckPreview._add_card_to_deck(card)
	$DeckPreview._load_deck()
	
func remove_card_from_deck(card):
	$DeckPreview._remove_card_from_deck(card)
	$DeckPreview._load_deck()

func _ready():
	$DeckPreview._load_deck()


func _on_LoadDeckButton_pressed():
	pass


func _on_SaveDeckButton_pressed():
	pass
