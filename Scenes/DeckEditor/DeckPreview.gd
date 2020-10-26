extends Control
var deck = {} # {} significa dicionario, basicamente {"nome da carta": quantidade, ...}
var cardBaseNode = load("res://Card/CardBase.tscn")
	
func _add_card_to_deck(card):
	if deck.has(card):
		if deck.get(card) < 4:
			deck[card] += 1 #se já tiver a carta apenas soma o hash
		return
	#se não houver a carta ao deck:
	deck[card] = 1 #adiciona uma carta nova com uma quantidade de 1

func _remove_card_from_deck(card):
	if deck.get(card) > 1:
		deck[card] -= 1
	else:
		deck.erase(card)

func _clear_deck_preview(): #apaga todas as cartas do deck preview, não confundir deck preview com deck
	for row in $".".get_children():
		for cardSlot in row.get_children():
			for child in cardSlot.get_children():
				child.queue_free()

func _load_deck(): # carrega deck no deck preview
	_clear_deck_preview()
	var row = 0 #representa o filho do node atual
	var cardSlot = 0 #representa o filho do filho do node atual e onde você quer inserir a carta
	for card in deck:
		for i in range(deck.get(card)):
			var newCardBase = cardBaseNode.instance()
			var cardSlotAtual = get_child(row).get_child(cardSlot)
			cardSlotAtual.add_child(newCardBase)
			#Configuração da nova carta:
			newCardBase.rect_size = cardSlotAtual.rect_size
			newCardBase.rect_min_size = cardSlotAtual.rect_min_size 
			newCardBase.connect("mouse_entered", $"../HoveredCardPreview", "_on_mouse_entered", [card])
			newCardBase.connect("card_left_mouse_pressed", $".." , "_remove_card_from_deck", [card])
			newCardBase._change_card_in_display(card)
			#Mudando o cardSlot ou linha que a carta vai ser inserida
			cardSlot += 1
			if cardSlot > 9:
				row += 1
				cardSlot = 0
				
			if row > 4:
				return
		
