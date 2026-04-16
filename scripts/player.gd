#extends CharacterBody2D

#const SPEED = 300.0

#func _ready() -> void:
#	if Game.has_saved_player_position:
#		global_position = Game.player_position

#func _physics_process(delta: float) -> void:
#	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
#	velocity = direction * SPEED
#	move_and_slide()
extends CharacterBody2D

const SPEED = 200.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var last_direction: Vector2 = Vector2.DOWN

func _ready() -> void:
	if Game.has_saved_player_position:
		global_position = Game.player_position

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	move_and_slide()

	if direction != Vector2.ZERO:
		last_direction = direction.normalized()

	_update_animation(direction)

func _update_animation(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		_play_idle_animation()
	else:
		_play_walk_animation(direction)

func _play_idle_animation() -> void:
	if abs(last_direction.x) > 0.1 and abs(last_direction.y) > 0.1:
		if last_direction.y > 0:
			animated_sprite.play("idle_front_turned")
		else:
			animated_sprite.play("idle_back_turned")

		animated_sprite.flip_h = last_direction.x < 0

	elif abs(last_direction.x) > abs(last_direction.y):
		animated_sprite.play("idle_side")
		animated_sprite.flip_h = last_direction.x < 0

	else:
		if last_direction.y > 0:
			animated_sprite.play("idle_front")
		else:
			animated_sprite.play("idle_back")

		animated_sprite.flip_h = false

func _play_walk_animation(direction: Vector2) -> void:
	if abs(direction.x) > 0.1 and abs(direction.y) > 0.1:
		if direction.y > 0:
			animated_sprite.play("walk_front_turned")
		else:
			animated_sprite.play("walk_back_turned")

		animated_sprite.flip_h = direction.x < 0

	elif abs(direction.x) > abs(direction.y):
		animated_sprite.play("walk_side")
		animated_sprite.flip_h = direction.x < 0

	else:
		if direction.y > 0:
			animated_sprite.play("walk_front")
		else:
			animated_sprite.play("walk_back")

		animated_sprite.flip_h = false
