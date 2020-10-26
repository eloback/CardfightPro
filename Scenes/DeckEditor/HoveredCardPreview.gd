extends Control

func _on_mouse_entered(card): #quando uma carta envia esse sinal muda o display
	$CardBase._change_card_in_display(card)
