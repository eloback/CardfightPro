extends HBoxContainer
export var PlayerType = ""
var DeckNode
var cardBaseNode = load("res://Card/CardBase.tscn")

func _ready():
	match PlayerType:
		"player":
			DeckNode = $"../Deck"
		"enemy":
			DeckNode = $"../EnemyDeck"

func _draw_to_hand():
	var card = DeckNode._draw_card()
	if card:
		_create_card_in_hand(card)

func _create_card_in_hand(card):
	var newCardBase = cardBaseNode.instance()
	add_child(newCardBase)
	#Configuração da nova carta:
	newCardBase.rect_size = Vector2(150, rect_size.y)
	newCardBase.rect_min_size = Vector2(150, rect_size.y)
	if PlayerType == "player":
		newCardBase.connect("mouse_entered", $".."/LateralBar/HoveredCardPreview, "_on_mouse_entered", [card.name])
		newCardBase.connect("card_left_mouse_pressed", self , "_left_mouse_pressed_in_card", [card])
		newCardBase._change_card_in_display(card.name)
	else:
		newCardBase._change_card_in_display("")

func left_mouse_pressed_in_card(card):
	pass
