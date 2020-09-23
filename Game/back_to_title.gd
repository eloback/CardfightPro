extends Control

func _ready():
	$VBoxContainer/Button.grab_focus()

func _on_Button_pressed():
	testFunction()



func testFunction():
	get_tree().change_scene("res://Title_Screen/TitleScreen.tscn")
