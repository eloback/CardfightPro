extends Control


# Declare member variables here. Examples:

# Called when the node enters the scene tree for the first time.
func _ready():
	for row in $Screen/Panels/CardContainer.get_children():
		for card in row.get_children():
			card.connect("mouse_pressed", self, "_change_display", [card])
	$Screen/TopRow/Button.connect("pressed", self, "_on_Button_Return_pressed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _change_display(card):
	$Screen/Panels/CardDisplay/CardBase._change_card_in_display(card)

func _on_Button_Return_pressed():
	$FadeIn.show()
	$FadeIn._fade_in()


func returnToTitle():
	get_tree().change_scene("res://Title_Screen/TitleScreen.tscn")
	pass

func _on_FadeIn_fade_finished():
	returnToTitle();
	pass
	
func getAppropriateMatches(target):
	
	var cards_searched = []
	
	for row in $Screen/Panels/CardContainer.get_children():
			for card in row.get_children():
				var matches = 0
				for i in range(target.length()):
					if i >= card.cardName.length():
						break
					if target[i] == card.cardName[i]:
						matches += 1
					else:
						break
				if matches == target.length():
					cards_searched.append(card)
	return cards_searched
	
func printSearchResults(results):
	if results:
		for card in results:
			var new_result = $CardSearched.duplicate()
			$Screen/Panels/CardDisplay/CardsSearched.add_child(new_result)
			new_result.get_child(0)._change_card_in_display(card)
			new_result.show()
			new_result.get_child(1).set_text(card.cardName)
	pass
	
func clearPastSearchResults():
	for child in $Screen/Panels/CardDisplay/CardsSearched.get_children():
		child.remove_and_skip()
	pass

func _on_LineEdit_text_changed(target):
	clearPastSearchResults()
	var searchResults = []
	if target:
		searchResults = getAppropriateMatches(target)
	printSearchResults(searchResults)
