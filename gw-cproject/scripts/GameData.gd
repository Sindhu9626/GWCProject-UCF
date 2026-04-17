extends Node
##Determines personality trait
#---Swap this out later when real gameplay feeds data in


#Thresholds (im putting random values for now)
#Finsh under 2 min
const SPEEDRUNNER: float = 120.0

#Finish over 5 min
const OVERTHINKER: float = 300.0

const TOTALTIME: float = 420.0

func get_personality() -> String:
	var completion_time: float = TOTALTIME - GameTimer.final_time_seconds #time in seconds
	
	if completion_time <= SPEEDRUNNER:
		return "Speedrunner"
	elif completion_time >= OVERTHINKER:
		return "Overthinker"
	else:
		return "Average Joe"
