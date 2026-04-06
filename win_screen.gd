extends Control

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

# Button to home screen
func _on_win_home_pressed():
	get_tree().change_scene_to_file("res://Title_screen.tscn")

# Button to notes screen
func _on_win_notes_pressed():
	get_tree().change_scene_to_file("res://notes_screen.tscn")
