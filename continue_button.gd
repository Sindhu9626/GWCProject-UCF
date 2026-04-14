extends Button

func on_note_continue_pressed():
	get_parent().visible = false
	get_tree().change_scene_to_file("res://game_screen.tscn")
