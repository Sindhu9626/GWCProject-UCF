extends CharacterBody2D

var nearby_interactable = null
const SPEED = 300.0

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	move_and_slide()

	if Input.is_action_just_pressed("Interact") and nearby_interactable != null:
		if nearby_interactable.has_method("Interact"):
			nearby_interactable.interact()

func _on_interact_area_area_entered(area):
	nearby_interactable = area.get_parent()

func _on_interact_area_area_exited(area):
	if nearby_interactable == area.get_parent():
		nearby_interactable = null
