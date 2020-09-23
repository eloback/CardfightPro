extends MarginContainer


# Declare member variables here. Examples:
onready var cardDatabase = preload("res://Card/CardDatabase.gd").new()
export var cardName = "example"

signal mouse_pressed

var MouseOver = false
export var size_loocked = true
var cardSize = rect_size

func _input(event):
	if event is InputEventMouseButton:
		if MouseOver == true:
			emit_signal("mouse_pressed")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var texturePath = cardDatabase.get_texture_path(cardName)

	if texturePath != null:

		$Card.texture = load(texturePath)
		if size_loocked:
			$Card.scale = cardSize/$Card.texture.get_size()
			$CardBack.scale = cardSize/$CardBack.texture.get_size()
		else:
			$Card.scale = rect_size/$Card.texture.get_size()
			$CardBack.scale = rect_size/$CardBack.texture.get_size()
		$Card.show()
		pass # Replace with function body.

func _change_card_in_display(card):
	cardName = card.cardName
	$Card.texture = load(cardDatabase.get_texture_path(cardName))
	if size_loocked:
		$Card.scale = cardSize/$Card.texture.get_size()
	else:
		$Card.scale = rect_size/$Card.texture.get_size()


func _inicializa_card_back(): #carrega imagem no card_back ao ser chamado
	$CardBack.texture = load("res://Assets/Textures/CardBack.jpg")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CardBase_mouse_entered():
	MouseOver = true


func _on_CardBase_mouse_exited():
	MouseOver = false
