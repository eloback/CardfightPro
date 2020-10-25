extends MarginContainer
export var cardName = ""
onready var originalNode = $".."
var mouse_locked = false
signal card_left_mouse_pressed

func _ready():
	var texturePath = global.get_texture_path(cardName)
	$Card.texture = load(texturePath)
	$CardBack.texture = load(global.get_texture_path("")) #carrega a textura padrão ou seja cardBack
	$Card.scale = rect_size/$Card.texture.get_size()
	$CardBack.scale = rect_size/$CardBack.texture.get_size()
	$Card.show()

func _process(delta):
	if mouse_locked:
		set_position(get_viewport().get_mouse_position())

func _change_card_in_display(card):
	$Card.texture = load(global.get_texture_path(card))
	$Card.scale = rect_size/$Card.texture.get_size()

func _gui_input(event):
	if event is InputEventMouseButton and event.get_button_index() == 1 and event.is_pressed():
		emit_signal("card_left_mouse_pressed")
