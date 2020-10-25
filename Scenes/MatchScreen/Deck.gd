extends PanelContainer
export var deckType = ""
var deck_dir = {} #dicionario deck
var deck = []

func _ready():
	match deckType:
		"player":
			deck_dir = global.deck
		"enemy":
			deck_dir = global.enemy_deck

func _ready_deck(): #transforma o dicionario deck em um array de cartas
	for card in deck_dir:
		var newCard = global.Card.new()
		#configurações da nova carta, o dicionario deve ser arrumado para possuir
		# um array com todas as propriedades da carta criada.
		newCard.name = card
		for quantity in range(deck_dir.get(card)):
			deck.push_back(newCard.duplicate())

func _suffle():
	deck.shuffle()

func _draw_card():
	if get_child_count() > 0 && deck.empty():
		remove_child($CardBase)
	return deck.pop_back()
