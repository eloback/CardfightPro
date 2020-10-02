extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var cardDatabase = preload("res://Card/CardDatabase.gd").new()
onready var cardBase = preload("res://Card/CardBase.tscn")
var searchedCardsArray = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func returnToTitle():
	get_tree().change_scene("res://Title_Screen/TitleScreen.tscn")
	pass

func _on_backButton_pressed():
	returnToTitle()
	pass # Replace with function body.

func getAppropriateMatches(target):
	
	var cards_searched = []
	
	for card in cardDatabase.cards:
			var matches = 0
			for i in range(target.length()):
				if i >= card.length():
					break
				if target[i] == card[i]:
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
			$SearchedCardsContainer/VScrollBar/ScrollContainer/VBoxContainer.add_child(cardSearshed)
			cardSearshed.set_name("CardSearshed")
			new_result.set_name("CardBase")
			cardName.set_name("Label")
			cardName.text = card
			cardSearshed.add_child(new_result)
			cardSearshed.add_child(cardName)
			new_result.rect_size = Vector2(50, 90)
			new_result.rect_min_size = Vector2(50, 90)
			new_result._change_card_in_display(card, cardDatabase)
	pass
	
func clearPastSearchResults():
	for child in $SearchedCardsContainer/VScrollBar/ScrollContainer/VBoxContainer.get_children():
		child.remove_and_skip()
	pass

func _on_SearchBar_text_changed(target):
	clearPastSearchResults()
	$SearchedCardsContainer/VScrollBar.hide() #esconde a scrollbar na barra de resultados
	var searchResults = []
	if target: #procura cartas
		searchResults = getAppropriateMatches(target)
	if searchResults: #apenas exibe a scroll bar se obtiver algo na busca
		$SearchedCardsContainer/VScrollBar.show()
		printSearchResults(searchResults)
