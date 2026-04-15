extends Button

@onready var confirm_dialog: ConfirmationDialog = $ConfirmationDialog

func _ready() -> void:
	$ConfirmationDialog.get_label().horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER

func _on_home_button_pressed():
	# Pulls up confirmation dialog when home button is pressed
	if is_pressed():
		confirm_dialog.popup_centered()
		confirm_dialog.show()

func _on_dialog_confirmed():
	get_tree().paused = false # unpauses so buttons will work
	get_tree().change_scene_to_file("res://scenes/Title_screen.tscn")
