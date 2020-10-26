extends Button

onready var file = 'res://data_save.txt'
var player_name
var atv = false

func _ready():
	load_file()
	

func _on_LineEdit_text_changed(new_text):
	player_name = new_text
	
func load_file():
	var f = File.new()
	f.open(file, File.READ)
	var data = f.get_var() 
	load_data(data)
	return 

func save_file():
	var arq = File.new()
	arq.open(file, File.WRITE)
	var data = {"nome jogador" : player_name, "Modo tela": OS.window_fullscreen}
	arq.store_var(data)
	arq.close()

func load_data(data):
	if data:
		if data.get("nome jogador"):
			$"../LineEdit".text = data.get("nome jogador")
		if data.get("Modo tela"):
			$"../Panel_fullscreen/Ckb_fullscreen".pressed = data.get("Modo tela")
	
	
func _on_Btn3_save_changes_pressed():
	save_file()
	atv = true
	
	

func _on_Btn_back_pressed():
	return_to_Menu()
	if(atv == false):
		OS.window_fullscreen = false


func return_to_Menu():
	get_tree().change_scene("res://Scenes/Title_Screen/TitleScreen.tscn")


func _on_Ckb_fullscreen_toggled(button_pressed):
	if(button_pressed == true):
		OS.window_fullscreen = true
	
		
	if(button_pressed == false):
		OS.window_fullscreen = false
	
