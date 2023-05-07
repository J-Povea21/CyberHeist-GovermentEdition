extends Node

var already_asked_questions = []

var current_question = ''

func display_question() -> String:
	var question_number = randi() % 14
	
	while question_number in already_asked_questions:
		question_number = randi() % 14
	
	# Once we check the questions hasn't been asked, we save the number in already_asked_questions
	already_asked_questions.append(question_number)
	
	
	var question = DataReader.questions_data["q%s" %question_number]

	# We save the question so we know whats the current question in game 
	current_question = question
	
	# And finally we return the question statement with options
	var question_statement = "%s \n Opciones: \n%s \n%s \n%s \n%s " %[
	question['statement'], 
	question['options'][0], 
	question['options'][1], 
	question['options'][2], 
	question['options'][3]
	]
	
	return question_statement
	
func correct_answer(answer: String) -> String:
	if int(answer) == int(current_question['answer']):
		return "Here will go the 'correct answer' message"
	else:
		return "Here will go the 'incorrect answer' message"
	
	

func valid_answer(answer: String) -> bool:
	return answer.is_valid_int() and (int(answer)>=1 and int(answer)<=4)
		
	
	
