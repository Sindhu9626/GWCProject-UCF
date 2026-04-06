#ResultsScreen.gd
func _ready():
	#This needs to be removed when we actually have a timer
	GameData.completion_time = 95.0 
	#Time can be changed for testing
	
	var personality = GameData.get_personality()
	$personalityLabel.text = personality
	draw_pie_chart(personality)
	
