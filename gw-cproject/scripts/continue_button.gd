extends Button

func on_continue_pressed():
	get_tree().change_scene_to_file("res://scenes/game_screen.tscn")
	
	owner.hide()
