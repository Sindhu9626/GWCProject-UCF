extends TextureButton

func _on_exit_pressed():
	print("exit button pressed")
	
	# Hides the notes page
	owner.hide()
