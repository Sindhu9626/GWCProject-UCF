extends Area2D


var entered = false


func _on_body_entered(body: PhysicsBody2D) -> void:
	entered = true


func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	entered = false
	

func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://scenes/HueyMagMiniGame.tscn")
