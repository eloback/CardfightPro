extends Control
signal fild_left_mouse_pressed

func _gui_input(event):
	if event is InputEventMouseButton and event.get_button_index() == 1 and event.is_pressed():
		emit_signal("fild_left_mouse_pressed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
