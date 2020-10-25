extends HBoxContainer
export var PlayerType = ""
var cardBaseNode = load("res://Card/CardBase.tscn")

func _draw_to_hand(Deck, HoveredCardReference):
	var card = Deck._draw_card()
	if card:
		_create_card_in_hand(card, HoveredCardReference)

func _create_card_in_hand(Card, HoveredCardReference):
	var newCardBase = cardBaseNode.instance()
	add_child(newCardBase)
	#Configuração da nova carta:
	newCardBase.rect_size = Vector2(76, rect_size.y) #tamanho que vai ser usado para calcular a resolução da carta
	newCardBase.rect_min_size = Vector2(76, rect_size.y) # Tamanho até da "hitbox" da carta, a proxima carta é sempre desenhada no final da hitbox
	if PlayerType == "player":
		newCardBase.connect("mouse_entered", HoveredCardReference, "_on_mouse_entered", [Card.name])
		newCardBase.connect("card_left_mouse_pressed", self , "_left_mouse_pressed_in_card", [newCardBase])
		newCardBase._change_card_in_display(Card.name)
	else:
		newCardBase._change_card_in_display("")

func _left_mouse_pressed_in_card(Card):
	if !Card.mouse_locked:
		remove_child(Card)
		get_node("/root/Control").add_child(Card)
		Card.mouse_locked = true
	else:
		Card.mouse_locked = false
