extends Button

func on_note_continue_pressed():
	GameTimer.reset_timer()
	GameTimer.start_timer()
	get_parent().visible = false
	get_tree().change_scene_to_file("res://scenes/game.tscn")
