extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Gets input direction (-1 to 1 for x and y)
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	# Sets velocity based on direction and speed
	velocity = direction * SPEED
	
	# Moves the character and handles collisions
	move_and_slide()
