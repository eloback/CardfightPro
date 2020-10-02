extends Control

func _ready():
	self.grab_focus()
	

func _on_Button_pressed():
	return_to_Menu()



func return_to_Menu():
	get_tree().change_scene("res://Scenes/Title_Screen/TitleScreen.tscn")
