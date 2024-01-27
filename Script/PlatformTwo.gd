extends Node3D

var posRight = true
var posLeft = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	if position.x < 115:
		posRight = true
		posLeft = false
	elif position.x > 130:
		posRight = false
		posLeft = true
		
	if posRight == true and posLeft == false:
		position.x += 0.05
	elif posLeft == true and posRight == false:
		position.x -= 0.05	

