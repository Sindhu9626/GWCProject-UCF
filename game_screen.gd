extends Control

var total_seconds: int = 900

func _ready():
	# Hides mouse when game starts
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	
	# Immediately updates the timer label so it starts with the right time
	update_timer_display()

func _input(event):
	if event.is_action_pressed("Pause"):
		toggle_pause()

func toggle_pause():
	# Toggles the pause state for the game tree
	get_tree().paused = !get_tree().paused
	
	# Toggles on visibility for the pause menu screen
	$CanvasLayer/pause.visible = get_tree().paused
	
	# Makes sure mouse is visible
	if get_tree().paused:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else: 
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _on_timer_timeout():
	# Checks the time then takes off a second, if time hits 0 takes user to lose screen
	if total_seconds > 0:
		total_seconds -= 1
		update_timer_display()
	else:
		$CanvasLayer/clock/Timer.stop()
		get_tree().change_scene_to_file("res://lose_screen.tscn")

func update_timer_display():
	# Sets up timer in correct minute:second format
	var minutes = total_seconds / 60
	var seconds = total_seconds % 60
	
	$CanvasLayer/clock/Timer/Label.text = "%02d:%02d" % [minutes, seconds]
