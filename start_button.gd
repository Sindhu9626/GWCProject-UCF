extends Button

func _on_start_button_pressed():
	print('Start button pressed\n')
	get_tree().change_scene_to_file("../gw-cproject/scenes/game.tscn.")
