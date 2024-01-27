extends CharacterBody3D

#const SPEED = 5.0
#const JUMP_VELOCITY = 4.5

@export var rotateSpeed = 50.0
var rotation_speed_z = 50.0
var rotation_speed_y = 30.0
var y_pos = position.y
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	if Input.is_action_pressed("ui_left") and is_on_floor():
		rotate_z(deg_to_rad(rotateSpeed * delta))
	if Input.is_action_pressed("ui_right") and is_on_floor():
		rotate_z(deg_to_rad(-rotateSpeed * delta))
	if Input.is_action_pressed("ui_up") and is_on_floor():
		rotate_y(deg_to_rad(-rotateSpeed * delta))
	if Input.is_action_pressed("ui_down") and is_on_floor():
		rotate_x(deg_to_rad(rotateSpeed * delta))
		
	#Define as velocidades de rotação
	# Verifica se a tecla "d" está sendo pressionada
	#if Input.is_action_pressed("ui_right"):
		# Rotaciona o objeto no eixo Z a partir da base
#
##Verifica se a tecla "w" está sendo pressionada
	#if Input.is_action_pressed("ui_up"):
		## Rotaciona o objeto no eixo Y a partir do centro
		#rotate_y(deg_to_rad(rotation_speed_y * delta))
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	#Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	 #Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

