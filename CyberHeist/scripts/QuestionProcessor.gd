extends Node


func display_question() -> String:
	
	var random_number = randi() % 3
	return DataReader.questions_data['q%s' % random_number]['statement']
	
	
