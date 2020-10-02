extends Node2D

class Card:
	var name: String
	var id: int
	var image: String
	var description: String
	var power: int
	var grade: int
	var shield: int
	
	func getName():
		return name
		
	func getId():
		return id
	
	func getImage():
		return image
		
	func getDescription():
		return description
		
	func getPower():
		return power
		
	func getShield():
		return shield
		
	func testFunc():
		pass

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
