extends Control
#Como a interface vai ser alterada, centralizei as referencias aqui:
onready var deck = [$Field/Player/Deck, $Field/Enemy/Deck]
onready var hand = [$Field/Player/Hand, $Field/Enemy/Hand]
onready var HoveredCardReference = $LateralBar/HoveredCardPreview

func _ready():
	deck[0]._ready_deck()
	deck[0]._suffle()
	deck[1]._ready_deck()
	deck[1]._suffle()
	pass

func _turn_pass():
	hand[0]._draw_to_hand(deck[0])
	hand[1]._draw_to_hand(deck[1])

func _on_Button_Pass_pressed():
	_turn_pass()


