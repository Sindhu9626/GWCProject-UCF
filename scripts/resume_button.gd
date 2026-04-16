extends Button

func _on_resume_button_pressed():
	print("resume button pressed\n")
	
	# Unpauses the game
	get_tree().paused = false
	
	# Hides the pause menu
	owner.hide()
