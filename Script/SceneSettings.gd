extends Node3D

var PlayerName
var player

func _ready():
	player = get_node("Player")
	PlayerName = get_node('CanvasLayer/Control/PlayerName')
	PlayerName.text = global.SelectedPlayer
	
	for camTrigger in get_tree().get_nodes_in_group("TriggerCam"):
		camTrigger.connect("body_entered", 
		func(player):
			var Trigger = camTrigger.name.right(2)
			for cameras in get_tree().get_nodes_in_group("Cameras"):
				var Camera = cameras.name.right(2)
				if Trigger == Camera:
					cameras.set_current(true))
					
	for Platform in get_tree().get_nodes_in_group("Platform"):
		Platform.connect("body_entered", func(player):
			Platform.add_child(player)
			)

func _process(_delta):
	for camera in get_tree().get_nodes_in_group("Cameras"):
		camera.look_at((player.position)+Vector3.UP, Vector3.UP)
	
	#if recording_frames:
		#capture_frame()
		

