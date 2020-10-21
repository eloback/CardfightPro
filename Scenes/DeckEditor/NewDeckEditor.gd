extends Control
var cardDB = preload("res://Card/CardDatabase.gd").new()

func _get_card_db():
	return cardDB

func _set_deck(newDeck):
	if _check_deck(newDeck):
		$DeckPreview.deck = newDeck
		$DeckPreview._load_deck()
	else:
		push_warning("Deck Invalido")
	
func _check_deck(deck):
	if !deck:
		return false
	var count = 0
	for card in deck:
		if !cardDB.cards.has(card):
			return false
		var cardNumber = deck.get(card)
		if cardNumber < 1 or cardNumber > 4:
			return false
		count += cardNumber
	if count > 50:
		return false
	print(count)
	return true
#add and remove card são chamadas quando o usuario aperta em alguma carta dos nodes SearchedCardContainer ou DeckPreview
func _add_card_to_deck(card):
	$DeckPreview._add_card_to_deck(card)
	$DeckPreview._load_deck()

func _remove_card_from_deck(card):
	$DeckPreview._remove_card_from_deck(card)
	$DeckPreview._load_deck()

func _ready(): #carrega o ultimo deck que o usuário estava modificando
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
