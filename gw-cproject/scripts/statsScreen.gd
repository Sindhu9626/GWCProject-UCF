#ResultsScreen.gd
extends Control

func _ready():
	#This needs to be removed when we actually have a timer
	#GameData.completion_time = 200.0
	#Time can be changed for testing
	
	var personality = GameData.get_personality()
	$ipad/"Personality".text = personality

	#Now lets get the cute ducks to dipsplay
	$ipad/"speedrunnersprite".visible = false
	$ipad/"overthinkersprite".visible = false
	$ipad/"averagejoesprite".visible = false
	
		#Show the correct sprite
	if personality == "Speedrunner":
		$ipad/"speedrunnersprite".visible = true
	elif personality == "Overthinker":
		$ipad/"overthinkersprite".visible = true
	else:
		$ipad/"averagejoesprite".visible = true

func _on_win_home_pressed():
	get_tree().change_scene_to_file("res://scenes/Title_screen.tscn")	
