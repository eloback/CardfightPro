extends Control
var deck = {}
var SERVER_PORT = 1;
var MAX_PLAYERS = 2;
var SERVER_IP = 0;

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

func _on_FileController_deck_loaded(newDeck):
	deck = newDeck
	$TextEdit.text = $FileController/FileDialog.current_path

func _on_LoadDeckButton_pressed():
	$FileController._open_file_dialog("open")


func _on_HostGameButton_pressed():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(SERVER_PORT, MAX_PLAYERS)
	get_tree().network_peer = peer

func _match_start():
	global.deck = deck
	get_tree().change_scene("res://Scenes/MatchScreen/MatchScreen.tscn")

func _on_ConnectButton_pressed():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(SERVER_IP, SERVER_PORT)
	get_tree().network_peer = peer

# lobby funcs

var player_info = {}

func _player_connected(id):
	# Called on both clients and server when a peer connects. Send my info to it.
	rpc_id(id, "register_player", global.player_name)

func _player_disconnected(id):
	player_info.erase(id) # Erase player from info.

func _connected_ok():
	pass # Only called on clients, not server. Will go unused; not useful here.

func _server_disconnected():
	pass # Server kicked us; show error and abort.

func _connected_fail():
	pass # Could not even connect to server; abort.

remote func register_player(info):
	# Get the id of the RPC sender.
	var id = get_tree().get_rpc_sender_id()
	# Store the info
	player_info[id] = info
