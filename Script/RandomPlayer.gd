extends Control

var SelectedPlayerLabel
var PlayButton

var PlayerLabel1
var PlayerLabel2
var PlayerLabel3
var PlayerLabel4

var PlayerSelectionLeft1
var PlayerSelectionLeft2
var PlayerSelectionLeft3
var PlayerSelectionLeft4
var PlayerSelectionRight1
var PlayerSelectionRight2
var PlayerSelectionRight3
var PlayerSelectionRight4

var timerSelect
var everyTick : int = 0

var selection
var rng = RandomNumberGenerator.new()

func _ready():
	SelectedPlayerLabel = get_node('TextureRect/VBoxContainer2/SelectedPlayerLabel')
	PlayButton = get_node('TextureRect/VBoxContainer2/PlayButton')
	
	PlayerLabel1 = get_node('TextureRect/VBoxContainer2/HBoxContainer/VBoxContainer/Player1')
	PlayerLabel2 = get_node('TextureRect/VBoxContainer2/HBoxContainer/VBoxContainer/Player2')
	PlayerLabel3 = get_node('TextureRect/VBoxContainer2/HBoxContainer/VBoxContainer/Player3')
	PlayerLabel4 = get_node('TextureRect/VBoxContainer2/HBoxContainer/VBoxContainer/Player4')
	
	PlayerSelectionLeft1 = get_node('TextureRect/VBoxContainer2/HBoxContainer/LeftArrow/PlayerSelection1')
	PlayerSelectionLeft2 = get_node('TextureRect/VBoxContainer2/HBoxContainer/LeftArrow/PlayerSelection2')
	PlayerSelectionLeft3 = get_node('TextureRect/VBoxContainer2/HBoxContainer/LeftArrow/PlayerSelection3')
	PlayerSelectionLeft4 = get_node('TextureRect/VBoxContainer2/HBoxContainer/LeftArrow/PlayerSelection4')	
	PlayerSelectionLeft1.set_modulate('ffffff00')
	PlayerSelectionLeft2.set_modulate('ffffff00')
	PlayerSelectionLeft3.set_modulate('ffffff00')
	PlayerSelectionLeft4.set_modulate('ffffff00')
	PlayerSelectionRight1 = get_node('TextureRect/VBoxContainer2/HBoxContainer/RightArrow/PlayerSelection1')
	PlayerSelectionRight2 = get_node('TextureRect/VBoxContainer2/HBoxContainer/RightArrow/PlayerSelection2')
	PlayerSelectionRight3 = get_node('TextureRect/VBoxContainer2/HBoxContainer/RightArrow/PlayerSelection3')
	PlayerSelectionRight4 = get_node('TextureRect/VBoxContainer2/HBoxContainer/RightArrow/PlayerSelection4')	
	PlayerSelectionRight1.set_modulate('ffffff00')
	PlayerSelectionRight2.set_modulate('ffffff00')
	PlayerSelectionRight3.set_modulate('ffffff00')
	PlayerSelectionRight4.set_modulate('ffffff00')
	
	PlayerLabel1.text = global.Player1
	PlayerLabel2.text = global.Player2
	PlayerLabel3.text = global.Player3
	PlayerLabel4.text = global.Player4
	
	timerSelect = Timer.new()
	timerSelect.wait_time = 0.2
	add_child(timerSelect)

	timerSelect.connect("timeout", _on_timer_tick)
	timerSelect.start()
	

func _process(_delta):
	pass

# Custom function to be called every second
func _on_timer_tick():
	_random_selection()
	
	everyTick = everyTick + 1
	
	match everyTick:
		10:
			timerSelect.wait_time = 0.5
		20:
			timerSelect.wait_time = 1.0
		25:
			stop_timer()
			match selection:
				1:
					global.SelectedPlayer = global.Player1
					SelectedPlayerLabel.text = global.SelectedPlayer + ', you are the chosen one!'
				2:
					global.SelectedPlayer = global.Player2
					SelectedPlayerLabel.text = global.SelectedPlayer + ', you are the chosen one!'
				3:
					global.SelectedPlayer = global.Player3
					SelectedPlayerLabel.text = global.SelectedPlayer + ', you are the chosen one!'
				4:
					global.SelectedPlayer = global.Player4
					SelectedPlayerLabel.text = global.SelectedPlayer + ', you are the chosen one!'
			
			SelectedPlayerLabel.set_visible(true)
			PlayButton.set_visible(true)

# When you want to stop the timer (e.g., when some condition is met)
func stop_timer():
	timerSelect.stop()
	timerSelect.queue_free()  # Optional: Free the timer node if you don't need it anymore

func _random_selection():
	selection = int(rng.randf_range(1, 5))
	
	match selection:	
		1:
			PlayerSelectionLeft1.set_modulate('ffffff')
			PlayerSelectionLeft2.set_modulate('ffffff00')
			PlayerSelectionLeft3.set_modulate('ffffff00')
			PlayerSelectionLeft4.set_modulate('ffffff00')
			PlayerSelectionRight1.set_modulate('ffffff')
			PlayerSelectionRight2.set_modulate('ffffff00')
			PlayerSelectionRight3.set_modulate('ffffff00')
			PlayerSelectionRight4.set_modulate('ffffff00')
		2:
			PlayerSelectionLeft1.set_modulate('ffffff00')
			PlayerSelectionLeft2.set_modulate('ffffff')
			PlayerSelectionLeft3.set_modulate('ffffff00')
			PlayerSelectionLeft4.set_modulate('ffffff00')
			PlayerSelectionRight1.set_modulate('ffffff00')
			PlayerSelectionRight2.set_modulate('ffffff')
			PlayerSelectionRight3.set_modulate('ffffff00')
			PlayerSelectionRight4.set_modulate('ffffff00')
		3:
			PlayerSelectionLeft1.set_modulate('ffffff00')
			PlayerSelectionLeft2.set_modulate('ffffff00')
			PlayerSelectionLeft3.set_modulate('ffffff')
			PlayerSelectionLeft4.set_modulate('ffffff00')
			PlayerSelectionRight1.set_modulate('ffffff00')
			PlayerSelectionRight2.set_modulate('ffffff00')
			PlayerSelectionRight3.set_modulate('ffffff')
			PlayerSelectionRight4.set_modulate('ffffff00')
		4:
			PlayerSelectionLeft1.set_modulate('ffffff00')
			PlayerSelectionLeft2.set_modulate('ffffff00')
			PlayerSelectionLeft3.set_modulate('ffffff00')
			PlayerSelectionLeft4.set_modulate('ffffff')
			PlayerSelectionRight1.set_modulate('ffffff00')
			PlayerSelectionRight2.set_modulate('ffffff00')
			PlayerSelectionRight3.set_modulate('ffffff00')
			PlayerSelectionRight4.set_modulate('ffffff')


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/SceneOne.tscn")
