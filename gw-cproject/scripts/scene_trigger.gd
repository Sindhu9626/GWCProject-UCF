extends Area2D

@onready var popup = $"../PressEnterPopup"
var entered = false
var player_ref: CharacterBody2D = null


func _on_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("player"):
		entered = true
		player_ref = body
		popup.visible = true
		print("Player entered trigger")
 

func _on_body_exited(body: PhysicsBody2D) -> void: 
	if body == player_ref:
		entered = false
		player_ref = null
		popup.visible = false
		print("Player exited trigger")

		

func _process(delta):
	if entered:
		if Input.is_action_just_pressed("ui_accept"):
			if player_ref != null:
				Game.player_position = player_ref.global_position
				Game.has_saved_player_position = true
		
			get_tree().change_scene_to_file("res://scenes/HueyMagMiniGame.tscn")
