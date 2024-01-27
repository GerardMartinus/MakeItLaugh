extends Control

var inputName
var last_modified_index := 0
var nomes_nodes

var PlayButton

func _ready():
	inputName = get_node('TextureRect/SubmitName/SubmitInput/InputName')
	PlayButton = get_node('TextureRect/BoxNames/VBoxContainer/PlayButton')
	
	nomes_nodes = get_tree().get_nodes_in_group("Nomes")
	
	for PlayerNames in nomes_nodes:
		match PlayerNames.name:
			'Player1':
				PlayerNames.text = global.Player1
			'Player2':
				PlayerNames.text = global.Player2
			'Player3':
				PlayerNames.text = global.Player3
			'Player4':
				PlayerNames.text = global.Player4

func _process(_delta):
	for PlayerNames in nomes_nodes:
		match PlayerNames.name:
			'Player1':
				global.Player1 = PlayerNames.text
			'Player2':
				global.Player2 = PlayerNames.text
			'Player3':
				global.Player3 = PlayerNames.text
			'Player4':
				global.Player4 = PlayerNames.text

func _on_input_name_text_submitted(new_text):
	inputName.clear()
	
	if nomes_nodes.size() > 0:
		var current_player_node = nomes_nodes[last_modified_index]

		if current_player_node is Label:
			current_player_node.text = new_text

			last_modified_index += 1

			if last_modified_index >= nomes_nodes.size():
				PlayButton.set_visible(true)
				inputName.set_editable(false)
				inputName.set_visible(false)


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/PlayerSelection.tscn")
