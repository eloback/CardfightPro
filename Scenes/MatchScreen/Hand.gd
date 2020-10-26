extends HBoxContainer
var cardBaseNode = load("res://Card/CardBase.tscn")
var moving_card

func _draw_to_hand(Deck):
	var card = Deck._draw_card()
	if card:
		_create_card_in_hand(card.name)

func _create_card_in_hand(Card):
	var newCardBase = cardBaseNode.instance()
	add_child(newCardBase)
	#Configuração da nova carta:
	newCardBase.rect_size = Vector2(76, rect_size.y) #tamanho que vai ser usado para calcular a resolução da carta
	newCardBase.rect_min_size = Vector2(76, rect_size.y) # Tamanho até da "hitbox" da carta, a proxima carta é sempre desenhada no final da hitbox
	if $"..".name == "Player":
		newCardBase.connect("mouse_entered", get_node("/root/Control").HoveredCardReference, "_on_mouse_entered", [Card])
		newCardBase.connect("card_left_mouse_pressed", self , "_left_mouse_pressed_in_card", [newCardBase])
		newCardBase._change_card_in_display(Card)
	else:
		newCardBase._change_card_in_display("")

func _left_mouse_pressed_in_card(Card):
	if !moving_card:
		remove_child(Card)
		get_node("/root/Control").add_child(Card)
		Card.mouse_locked = true
		moving_card = Card

func _on_Player_fild_left_mouse_pressed():
	print(moving_card)
	if moving_card:
		_create_card_in_hand(moving_card.cardName)
		moving_card.queue_free()
