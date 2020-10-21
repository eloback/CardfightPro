extends Control
var deck = {}

func _on_FileController_deck_loaded(newDeck):
	deck = newDeck
	$TextEdit.text = $FileController/FileDialog.current_path

func _on_LoadDeckButton_pressed():
	$FileController._open_file_dialog("open")


func _on_HostGameButton_pressed():
	global.deck = deck
	get_tree().change_scene("res://Scenes/MatchScreen/MatchScreen.tscn")
