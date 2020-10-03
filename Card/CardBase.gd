extends MarginContainer

onready var cardDatabase = preload("res://Card/CardDatabase.gd").new()
export var cardName = ""

func _ready():
	
	var texturePath = cardDatabase.get_texture_path(cardName)

	if texturePath != null:
		$Card.texture = load(texturePath)
		$CardBack.texture = load(cardDatabase.get_texture_path("")) #carrega a textura padrão ou seja cardBack
		$Card.scale = rect_size/$Card.texture.get_size()
		#$CardBack.scale = rect_size/$CardBack.texture.get_size()
		$Card.show()
		pass # Replace with function body.

func _change_card_in_display(card, cardBase):
	$Card.texture = load(cardBase.get_texture_path(card))
	$Card.scale = rect_size/$Card.texture.get_size()

