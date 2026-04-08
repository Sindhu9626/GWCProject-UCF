extends Button

func on_continue_pressed():
	get_tree().change_scene_to_file("res://game_screen.tscn")
	
	owner.hide()
