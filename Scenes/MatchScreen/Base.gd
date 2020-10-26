extends Control
export var base_type = ""

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CardBase.connect("card_left_mouse_pressed", self, "_left_mouse_pressed")

func _left_mouse_pressed():
	var card = get_node("/root/Control").hand[0].moving_card
	if card:
		$CardBase._change_card_in_display(card.cardName)
		card.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
