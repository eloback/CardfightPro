extends Control


func _ready():
	$Deck._ready_deck()
	$Deck._suffle()
	$EnemyDeck._ready_deck()
	$EnemyDeck._suffle()
	pass

func _turn_pass():
	$Hand._draw_to_hand()
	$EnemyHand._draw_to_hand()

func _on_Button_Pass_pressed():
	_turn_pass()
