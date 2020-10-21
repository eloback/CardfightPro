extends Control
var deck = {}

func _ready():
	$FileDialog.add_filter("*.dk ; Deck Files")
	$FileDialog.current_dir = "user://"
	$FileDialog.current_file = "deck"
	pass

func _open_file_dialog(mode):
	
	match mode:
		"open":
			$FileDialog.disconnect("file_selected", self, "_save_file")
			$FileDialog.set_mode(FileDialog.MODE_OPEN_FILE)
			$FileDialog.connect("file_selected", self, "_open_file")
		"save":
			$FileDialog.disconnect("file_selected", self, "_open_file")
			$FileDialog.set_mode(FileDialog.MODE_SAVE_FILE)
			$FileDialog.connect("file_selected", self, "_save_file")
	$FileDialog.popup()

func _open_file(path):
	print(path)
	var f = File.new()
	f.open(path, File.READ)
	deck = f.get_var()
	f.close()
	$".."._set_deck(deck)
	return


func _save_file(path):
	print(path)
	var save_deck = File.new()
	save_deck.open(path, File.WRITE)
	save_deck.store_var(deck)
	save_deck.close()
