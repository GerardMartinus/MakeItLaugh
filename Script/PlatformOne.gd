extends Node3D

var posRight = true
var posLeft = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	if position.z < -20:
		posRight = true
		posLeft = false
	elif position.z > 10:
		posRight = false
		posLeft = true
		
	if posRight == true and posLeft == false:
		position.z += 0.05
	elif posLeft == true and posRight == false:
		position.z -= 0.05	

