extends Control
var cardDB = preload("res://Card/CardDatabase.gd").new()

func _ready(): #carrega o ultimo deck que o usuário estava modificando
	$DeckPreview._load_deck()

func _get_card_db():
	return cardDB

func _set_deck(newDeck): #carrega o deck escolhido pelo usuario, no deckPreview
	$DeckPreview.deck = newDeck
	$DeckPreview._load_deck()
	
#add and remove card são chamadas quando o usuario aperta em alguma carta dos nodes SearchedCardContainer ou DeckPreview
func _add_card_to_deck(card):
	$DeckPreview._add_card_to_deck(card)
	$DeckPreview._load_deck()

func _remove_card_from_deck(card):
	$DeckPreview._remove_card_from_deck(card)
	$DeckPreview._load_deck()

func load_deck():
	$FileController._open_file_dialog("open")
	
func save_deck():
	$FileController._open_file_dialog("save")

func _on_LoadDeckButton_pressed(): #precisa de parametro de deck_name
	load_deck()
	pass

func _on_SaveDeckButton_pressed(): #precisa de parametro de deck_name
	$FileController.deck = $DeckPreview.deck
	save_deck()
	pass
