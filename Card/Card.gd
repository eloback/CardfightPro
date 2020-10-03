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

