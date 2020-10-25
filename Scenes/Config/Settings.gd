extends Control
onready var musicPlayer = $MusicPlayer

func _ready():
	
	pass

func _on_Btn_On_Off_toggled(button_pressed):
	if (button_pressed == true):
		musicPlayer.play()
	if (button_pressed == false):
		musicPlayer.stop()


func _on_Slider_music_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)



