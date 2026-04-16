extends Node2D

@export var target_scene: String = ""
@onready var line_edit: LineEdit = $LineEdit
@onready var label: Label = $Label
@export var correct_answer: String = "14.8"
var is_transitioning = false


func _on_submit_button_pressed():
	var text = line_edit.text
	_on_line_edit_text_submitted(text)

func _ready():
	line_edit.text_submitted.connect(_on_line_edit_text_submitted)

func _on_line_edit_text_submitted(new_text: String) -> void:
	
	
	if (new_text == correct_answer):
		label.text = "Correct!" 
		print("Correct")
		_on_trigger_event()
	else:
		label.text = "Incorrect, try again."
		line_edit.clear()
		print("Incorrect, try again.")
		

func _on_trigger_event():
	# 1. Set the flag to true to prevent multiple triggers
	if is_transitioning:
		return
	is_transitioning = true
	
	# 2. Wait for a small delay (e.g., 0.5 seconds)
	await get_tree().create_timer(0.5).timeout
	
	# 3. Transition to the next screen
	get_tree().change_scene_to_file(target_scene)
