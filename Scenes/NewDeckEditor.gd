extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
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


func _on_SearchBar_text_changed(new_text):
	
	pass # Replace with function body.
