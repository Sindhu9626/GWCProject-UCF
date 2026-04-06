extends Node2D

func interact():
	print("Coin interact() called")
	get_tree().change_scene_to_file("res://scenes/BentoMiniGame.tscn")
