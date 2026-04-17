extends Control
@onready var time_label = $clock/Label


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	time_label.text = GameTimer.final_time

# Button to home screen
func _on_home_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Title_screen.tscn")
	
# Button to notes screen
func _on_notes_button_pressed():
	get_tree().change_scene_to_file("res://scenes/notes_screen.tscn")

#Button to stats screen
func _on_stats_button_pressed():
	get_tree().change_scene_to_file("res://scenes/stats_screen.tscn")
