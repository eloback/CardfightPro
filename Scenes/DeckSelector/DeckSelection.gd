extends Control
var deck = {}

func _on_FileController_deck_loaded(newDeck):
	deck = newDeck
	print(deck)

func _on_LoadDeckButton_pressed():
	$FileController._open_file_dialog("open")
