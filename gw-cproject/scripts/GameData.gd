extends Node

#---Swap this out later when real gameplay feeds data in
var completion_time: float = 0.0 #time in seconds

#Thresholds (im putting random values for now)
#Finsh under 2 min
const SPEEDRUNNER: float = 120.0

#Finish over 5 min
const OVERTHINKER: float = 300.0

func get_personality() -> String:
	if completion_time <= SPEEDRUNNER:
		return "Speedrunner"
	elif completion_time >= OVERTHINKER:
		return "Overthinker"
	else:
		return "Average Joe"
