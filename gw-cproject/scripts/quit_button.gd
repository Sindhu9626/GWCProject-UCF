extends Button

@onready var confirm_dialog: ConfirmationDialog = $ConfirmationDialog

func _ready() -> void:
	$ConfirmationDialog.get_label().horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER

# signal to quit the game
func _on_quit_button_pressed():
	if is_pressed():
		confirm_dialog.popup_centered()
		confirm_dialog.show()

func _on_dialog_confirmed():
	get_tree().quit()
