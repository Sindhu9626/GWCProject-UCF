extends Control

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

# Button to home screen
func _on_win_home_pressed():
	get_tree().change_scene_to_file("res://scenes/Title_screen.tscn")

# Button to notes screen
func _on_win_notes_pressed():
	get_tree().change_scene_to_file("res://scenes/notes_screen.tscn")

# Button to stats screen
func _on_stats_button_pressed():
	GameData.completion_time = 900.0
	get_tree().change_scene_to_file("res://scenes/stats_screen.tscn")
