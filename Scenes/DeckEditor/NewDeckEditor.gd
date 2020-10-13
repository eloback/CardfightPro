extends Control
var cardDB = preload("res://Card/CardDatabase.gd").new()

func _get_card_db():
	return cardDB

#add and remove card são chamadas quando o usuario aperta em alguma carta dos nodes SearchedCardContainer ou DeckPreview
func _add_card_to_deck(card):
	$DeckPreview._add_card_to_deck(card)
	$DeckPreview._load_deck()

func _remove_card_from_deck(card):
	$DeckPreview._remove_card_from_deck(card)
	$DeckPreview._load_deck()

func _ready(): #carrega o ultimo deck que o usuário estava modificando
	$DeckPreview._load_deck()


func _on_LoadDeckButton_pressed():
	pass


func _on_SaveDeckButton_pressed():
	pass
