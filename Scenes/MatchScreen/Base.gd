extends Control
export var base_type = ""

func _ready():
	$CardBase.connect("card_left_mouse_pressed", self, "_left_mouse_pressed")

func _left_mouse_pressed():
	var card = get_node("/root/Control").hand[0].moving_card
	if card:
		$CardBase._change_card_in_display(card.cardName)
		card.queue_free()
	elif $CardBase.cardName != "":
		var newCardBase = $CardBase.duplicate()
		get_node("/root/Control").add_child(newCardBase)
		#Configuração da nova carta:
		newCardBase.rect_size = Vector2(76, rect_size.y) #tamanho que vai ser usado para calcular a resolução da carta
		newCardBase.rect_min_size = Vector2(76, rect_size.y) # Tamanho até da "hitbox" da carta, a proxima carta é sempre desenhada no final da hitbox
		newCardBase.connect("mouse_entered", get_node("/root/Control").HoveredCardReference, "_on_mouse_entered", [$CardBase.cardName])
		newCardBase.connect("card_left_mouse_pressed", self , "_left_mouse_pressed_in_card", [newCardBase])
		newCardBase._change_card_in_display($CardBase.cardName)
		get_node("/root/Control").hand[0]._left_mouse_pressed_in_card(newCardBase)
		$CardBase._change_card_in_display("")
