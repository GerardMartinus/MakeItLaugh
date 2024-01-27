extends CharacterBody3D


@export_category("Movement Settings")
@export var SPEED = 5.0
@export var FORWARD_SPEED = 5.0
@export var BACK_SPEED = 5.0
@export var TURN_SPEED = 0.06
@export var JUMP_VELOCITY = 5.5
@export var friction = 0.01

@onready var animation_player = $Shape/AnimationPlayer
var Vec3Z = Vector3.ZERO

var pool
var drawning = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	var reload = Timer.new()
	reload.wait_time = 5.0
	reload.one_shot = true
	add_child(reload)
	reload.connect("timeout", func():
		get_tree().reload_current_scene()
	)
			
	for obstacle in get_tree().get_nodes_in_group("Obstacle"):
		obstacle.connect("body_entered", func(player):	
			reload.start()
			self.set_visible(false)
			velocity.y = 0
			drawning = true
			SPEED = 0
			FORWARD_SPEED = 0
			BACK_SPEED = 0
			JUMP_VELOCITY = 0
			friction = 0
			)
			
			
func _physics_process(delta):
	pool = get_node("../Pool")

	if not is_on_floor() and drawning == false:
		velocity.y -= gravity * delta
		animation_player.play("Armature|mixamo_com|Layer0_Armature_001")

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation_player.play("Armature_002|mixamo_com|Layer0_Armature_001")		
		
		
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(0, 0, input_dir.y)).normalized()

	if direction:
		animation_player.play("Armature_001|mixamo_com|Layer0_Armature_001")
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		animation_player.play("Armature|mixamo_com|Layer0")
		velocity.x -= velocity.x * friction
		velocity.z -= velocity.z * friction

	if abs(velocity.x) < 0.01:
		velocity.x = 0

	if abs(velocity.z) < 0.01:
		velocity.z = 0
	
	# IF turn left WHILE moving back, turn right
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_down"):
		rotation.z -= Vec3Z.y + TURN_SPEED #* V_LOOK_SENS
		rotation.z = clamp(rotation.x, -50, 90)
		rotation.y -= Vec3Z.y + TURN_SPEED #* M_LOOK_SENS
	
	elif Input.is_action_pressed("ui_left"):
		rotation.z += Vec3Z.y - TURN_SPEED #* V_LOOK_SENS
		rotation.z = clamp(rotation.x, -50, 90)
		rotation.y += Vec3Z.y + TURN_SPEED #* M_LOOK_SENS

	# IF turn right WHILE moving back, turn left
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_down"):
		rotation.z += Vec3Z.y - TURN_SPEED #* V_LOOK_SENS
		rotation.z = clamp(rotation.x, -50, 90)
		rotation.y += Vec3Z.y + TURN_SPEED #* M_LOOK_SENS
		
	elif Input.is_action_pressed("ui_right"):
		rotation.z -= Vec3Z.y + TURN_SPEED #* V_LOOK_SENS
		rotation.z = clamp(rotation.x, -50, 90)
		rotation.y -= Vec3Z.y + TURN_SPEED #* M_LOOK_SENS

	move_and_slide()

func _on_finish_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print('Finishou')

