extends Control

@onready var timer_label = $clock/timer

func _ready():
	# Makes sure the mouse is visible
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func _on_lose_timer_timeout():
	# Does the flashing animation for the lose screen
	timer_label.visible = !timer_label.visible

# Button to home screen
func _on_lose_home_pressed():
	get_tree().change_scene_to_file("res://scenes/Title_screen.tscn")

# Button to play again
func _on_lose_play_pressed():
	get_tree().change_scene_to_file("res://scenes/game_screen.tscn")

# Button to stats screen
func _on_stats_button_pressed():
	GameData.completion_time = 900.0
	get_tree().change_scene_to_file("res://scenes/stats_screen.tscn")
