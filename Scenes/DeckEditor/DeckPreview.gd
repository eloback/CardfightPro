extends Control

var deck = {} # {} significa dicionario, basicamente {"nome da carta": quantidade, ...}
onready var cardDB = $".."._get_card_db()
var cardBaseNode = preload("res://Card/CardBase.tscn")
	
func _add_card_to_deck(card):
	if deck.has(card):
		deck[card] += 1 #se já tiver a carta apenas soma o hash
		return
	#se não houver a carta ao deck:
	deck[card] = 1 #adiciona uma carta nova com uma quantidade de 1
	
func _load_deck():
	var row = 0 #representa o filho do node atual
	var column = 0 #representa o filho do filho do node atual e onde você quer inserir a carta
	for card in deck:
		for i in range(deck.get(card)):
			var newCardBase = cardBaseNode.instance()
			get_child(row).get_child(column).add_child(newCardBase)
			#Configuração da nova carta:
			newCardBase.rect_size = get_child(row).get_child(column).rect_size
			newCardBase.rect_min_size = get_child(row).get_child(column).rect_min_size 
			newCardBase.connect("mouse_entered", $"../HoveredCardPreview", "_on_mouse_entered", [card])
			newCardBase._change_card_in_display(card, cardDB)
			#Mudando o cardSlot ou linha que a carta vai ser inserida
			column += 1
			if column > 9:
				row += 1
				column = 0
		
