extends Node2D

@export var correct_answer: String = ""
@export var target_scene: String = ""
@export var example_answer_text: String = "Example: 1423"
@export var questionLine_text: String = "Enter"

@onready var line_edit: LineEdit = $LineEdit
@onready var labelQ: Label = $QuestionLabel
@onready var label: Label = $AnswerLabel
@onready var example: Label = $ExampleLabel
@onready var submit_button: Button = $SubmitButton

var is_transitioning := false

func _ready() -> void:
	label.text = ""
	submit_button.pressed.connect(_on_submit_button_pressed)
	example.text = example_answer_text
	labelQ.text = questionLine_text

func _on_submit_button_pressed() -> void:
	var user_answer := line_edit.text.strip_edges()

	if user_answer == correct_answer:
		label.text = "Correct!"
		_on_correct_answer()
	else:
		label.text = "Incorrect, try again."
		line_edit.clear()

func _on_correct_answer() -> void:
	if is_transitioning:
		return
	is_transitioning = true

	if target_scene == "":
		print("No target_scene set")
		return

	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file(target_scene)
