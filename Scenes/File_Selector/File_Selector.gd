#instruções sobre funcionamento da cena
#	Carrega o deck escolhido pelo usuario e salva seu conteudo no 
#	dicionario "deck", ao mesmo tempo emite o sinal "deckLoaded.
#	Também pode salvar um deck no diretorio escolhindo pelo usuario
extends Control
var deck = {}
signal deck_loaded(newDeck)

func _ready(): # configurações do fileDialog
	$FileDialog.add_filter("*.dk ; Deck Files") #file type suportado
	$FileDialog.current_dir = "user://"
	$FileDialog.current_file = "deck"

func _check_deck(): #verifica se o deck carregado é valido ou não
	if !deck:
		return false
	var count = 0
	for card in deck:
		if !global.cardDatabase.cards.has(card):
			return false
		var cardNumber = deck.get(card)
		if cardNumber < 1 or cardNumber > 4:
			return false
		count += cardNumber
	if count == 50:
		return true
	return false

func _open_file_dialog(mode): #abre e configura o dialog
	match mode:
		"open":
			$FileDialog.disconnect("file_selected", self, "_save_file")
			$FileDialog.set_mode(FileDialog.MODE_OPEN_FILE)
			$FileDialog.connect("file_selected", self, "_open_file")
		"save":
			if !_check_deck():
				return
			$FileDialog.disconnect("file_selected", self, "_open_file")
			$FileDialog.set_mode(FileDialog.MODE_SAVE_FILE)
			$FileDialog.connect("file_selected", self, "_save_file")
			
	$FileDialog.popup()

func _open_file(path):
	var f = File.new()
	f.open(path, File.READ)
	deck = f.get_var()
	f.close()
	if _check_deck():
		emit_signal("deck_loaded", deck) #emite um sinal com o deck como parametro
	push_warning("Deck Invalido")

func _save_file(path):
	var save_deck = File.new()
	save_deck.open(path, File.WRITE)
	save_deck.store_var(deck)
	save_deck.close()
	
