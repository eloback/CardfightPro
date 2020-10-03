extends Control

var cardBase = preload("res://Card/CardBase.tscn")
onready var cardDatabase = $".."._get_card_db()
var searchedCardsArray = []

func getAppropriateMatches(target):
	
	var cards_searched = []
	for card in cardDatabase.cards:
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

	
func printSearchResults(results):
	if results:
		for card in results:
			var cardSearshed = HBoxContainer.new()
			var new_result = cardBase.instance()
			var cardName = Label.new()
			$VScrollBar/ScrollContainer/VBoxContainer.add_child(cardSearshed)
			cardSearshed.set_name("CardSearshed")
			new_result.set_name("CardBase")
			cardName.set_name("Label")
			cardName.text = card
			cardSearshed.add_child(new_result)
			cardSearshed.add_child(cardName)
			new_result.rect_size = Vector2(60, 90)
			new_result.rect_min_size = Vector2(60, 90)
			new_result._change_card_in_display(card, cardDatabase)
			new_result.connect("mouse_entered", $"../HoveredCardPreview", "_on_mouse_entered", [card])
			#new_result.connect("mo")
	pass

func clearPastSearchResults():
	for child in $VScrollBar/ScrollContainer/VBoxContainer.get_children():
		child.remove_and_skip()
	pass

func _on_SearchBar_text_changed(target):
	clearPastSearchResults()
	$VScrollBar.hide() #esconde a scrollbar na barra de resultados
	var searchResults = []
	if target: #procura cartas
		searchResults = getAppropriateMatches(target)
	if searchResults: #apenas exibe a scroll bar se obtiver algo na busca
		$VScrollBar.show()
		printSearchResults(searchResults)
