extends Control

var deck = []
onready var cardDB = $".."._get_card_db()
var cardBaseNode = preload("res://Card/CardBase.tscn")

class cardDeck:
	var name
	var quantity = 0
	
func _add_card_to_deck(card):
	for cardInDeck in deck:
		if card == cardInDeck.name:
			if cardInDeck.quantity < 4:
				cardInDeck.quantity += 1
				return
			else:
				return
	var newCardInDeck = cardDeck.new()
	newCardInDeck.name = card
	newCardInDeck.quantity = 1
	deck.push_back(newCardInDeck)
	
func _load_deck():
	var row = 0
	var column = 0
	for card in deck:
		for i in range(card.quantity):
			var newCardBase = cardBaseNode.instance()
			get_child(row).get_child(column).add_child(newCardBase)
			newCardBase.rect_size = get_child(row).get_child(column).rect_size
			newCardBase.rect_min_size = get_child(row).get_child(column).rect_min_size
			newCardBase.connect("mouse_entered", $"../HoveredCardPreview", "_on_mouse_entered", [card.name])
			newCardBase._change_card_in_display(card.name, cardDB)
			column += 1
			if column > 9:
				row += 1
				column = 0
