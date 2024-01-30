extends Control


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	for button in get_tree().get_nodes_in_group("buttons"):
		button.connect("pressed", func():
			match button.name:
				"Back":
					get_tree().change_scene_to_file("res://Scenes/MENU.tscn")
		)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
