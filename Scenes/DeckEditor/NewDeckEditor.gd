extends Control
var cardDB = preload("res://Card/CardDatabase.gd").new()

func _get_card_db():
	return cardDB

func _ready():
	$DeckPreview._add_card_to_deck("Blaster Blade")
	$DeckPreview._add_card_to_deck("Blaster Blade")
	$DeckPreview._add_card_to_deck("Blaster Blade")
	$DeckPreview._add_card_to_deck("Blaster Blade")
	$DeckPreview._add_card_to_deck("Dragheart, Luard")
	$DeckPreview._add_card_to_deck("Dragheart, Luard")
	$DeckPreview._add_card_to_deck("Dragheart, Luard")
	$DeckPreview._add_card_to_deck("Dragheart, Luard")
	$DeckPreview._add_card_to_deck("Dragonic Overlord")
	$DeckPreview._add_card_to_deck("Dragonic Overlord")
	$DeckPreview._add_card_to_deck("Dragonic Overlord")
	$DeckPreview._add_card_to_deck("Dragonic Overlord")
	$DeckPreview._add_card_to_deck("Seeker, Sacred Wingal")
	$DeckPreview._add_card_to_deck("Seeker, Sacred Wingal")
	$DeckPreview._add_card_to_deck("Seeker, Sacred Wingal")
	$DeckPreview._add_card_to_deck("Seeker, Sacred Wingal")
	$DeckPreview._add_card_to_deck("Illusionary Revenger, Mordred Phantom")
	$DeckPreview._add_card_to_deck("Illusionary Revenger, Mordred Phantom")
	$DeckPreview._add_card_to_deck("Illusionary Revenger, Mordred Phantom")
	$DeckPreview._add_card_to_deck("Illusionary Revenger, Mordred Phantom")
	$DeckPreview._add_card_to_deck("Lucky Rise, Elprina")
	$DeckPreview._add_card_to_deck("Lucky Rise, Elprina")
	$DeckPreview._add_card_to_deck("Lucky Rise, Elprina")
	$DeckPreview._add_card_to_deck("Lucky Rise, Elprina")
	$DeckPreview._load_deck()
