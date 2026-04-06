extends CharacterBody2D


const SPEED = 300.0
var nearby_interactable = null


func _physics_process(delta: float) -> void:

	# Gets input direction (-1 to 1 for x and y)
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	# Sets velocity based on direction and speed
	velocity = direction * SPEED
	
	# Moves the character and handles collisions
	move_and_slide()
	
	if Input.is_action_just_pressed("interact"):
		print("E pressed")
		
		if nearby_interactable == null:
			print("Nothing nerby to interact with")
		else:
			print("Nearby interactable found:", nearby_interactable.name)
			
			if nearby_interactable.has_method("interact"):
				print("Calling interact()")
				nearby_interactable.interact()
			else:
				print("Object does not have interact()")
				
func _on_interact_area_area_entered(area):
	print("Entered area:", area.name)
	nearby_interactable = area.get_parent()
	print("Set nearby_interactable to:", nearby_interactable.name)

func _on_interact_area_area_exited(area):
	print("Exited area:", area.name)
	if nearby_interactable == area.get_parent():
		nearby_interactable = null
		print("Cleared nearby_interactable")
