extends Node

var total_seconds: int = 420
var is_running: bool = false
var final_time: String = ""

func start_timer():
	is_running = true

func stop_timer():
	is_running = false

func reset_timer():
	total_seconds = 420
	is_running = false

func tick():
	if is_running and total_seconds > 0:
		total_seconds -= 1

func get_time_text() -> String:
	var minutes = total_seconds / 60
	var seconds = total_seconds % 60
	return "%02d:%02d" % [minutes, seconds]
