extends Control

var cardBaseNode = preload("res://Card/CardBase.tscn")
var searchedCardsArray = []

func _get_appropriate_matches(target): # procura dentro do database de cartas, uma carta alvo
	var cards_searched = []
	for card in global.cardDatabase.cards:
			var matches = 0
			for i in range(target.length()):
				if i >= card.length():
					break
				if target[i].to_lower() == card[i].to_lower():
					matches += 1
				else:
					break
			if matches == target.length():
				cards_searched.append(card)
	return cards_searched

	
func _print_search_results(results):
	if results:
		for card in results:
			var cardSearshed = HBoxContainer.new() # nova carta é formada por uma card base e label dentro de um hbox
			var cardBase = cardBaseNode.instance()
			var cardLabel = Label.new()
			$VScrollBar/ScrollContainer/VBoxContainer.add_child(cardSearshed) #adiciona a nova Carta na busca
			cardSearshed.add_child(cardBase) 
			cardSearshed.add_child(cardLabel)
			#configuração da nova carta
			cardLabel.text = card 
			cardBase.rect_size = Vector2(50, 80)
			cardBase.rect_min_size = Vector2(50, 80)
			cardBase._change_card_in_display(card)
			cardBase.connect("mouse_entered", $"../HoveredCardPreview", "_on_mouse_entered", [card]) #connect(<signal>, <node>, <func>, <[args]>)
			cardBase.connect("card_left_mouse_pressed", $".." , "_add_card_to_deck", [card])

func _clear_past_search_results():
	for child in $VScrollBar/ScrollContainer/VBoxContainer.get_children():
		child.remove_and_skip()

func _on_SearchBar_text_changed(target):
	_clear_past_search_results()
	$VScrollBar.hide() #esconde a scrollbar na barra de resultados
	var searchResults = []
	if target: #procura cartas
		searchResults = _get_appropriate_matches(target)
	if searchResults: #apenas exibe a scroll bar se obtiver algo na busca
		$VScrollBar.show()
		_print_search_results(searchResults)
