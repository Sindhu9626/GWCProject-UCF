extends Node2D

@onready var line_edit: LineEdit = $LineEdit
@onready var label: Label = $Label


func _ready():
	line_edit.text_submitted.connect(on_LineEdit_text_entered) # Replace with function body.


func on_LineEdit_text_entered(new_text: String) -> void:
		label.text = "Answer is: " + new_text
