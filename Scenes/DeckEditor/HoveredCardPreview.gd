extends Control

onready var cardDB = $".."._get_card_db()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _on_mouse_entered(card):
	$CardBase._change_card_in_display(card, cardDB)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
