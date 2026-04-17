extends Control

@onready var countdown_timer = $CountDownTimer
@onready var timer_label = $CanvasLayer/TimerControl/TimeLabel

func _ready():
	timer_label.text = GameTimer.get_time_text()
	countdown_timer.start()

func _on_count_down_timer_timeout():
	GameTimer.tick()
	timer_label.text = GameTimer.get_time_text()

	if GameTimer.total_seconds <= 0:
		GameTimer.stop_timer()
		get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")
