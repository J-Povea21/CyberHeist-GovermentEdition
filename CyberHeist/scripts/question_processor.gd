extends Node

var already_asked_questions = []

var current_question = ''

var failed_questions = 0

var right_questions = 0

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
	

func _select_progress_message() -> String:
	return DataReader.messages['progress'].pick_random()

func _select_bad_new_message() -> String:
	return DataReader.messages['bad_news'].pick_random()
	
func check_answer(answer: String) -> String:
	
	# We get the explanation message of the question
	var explanation_message = current_question['explanation']
	var formated_text = "%s \n\n Explicación: %s \n"
	
	if int(answer) == int(current_question['answer']):	
		right_questions += 1
		var progress_message = _select_progress_message()
		
		return formated_text %  [Colors.apply_color(progress_message, Colors.TYPES.SUCCESS),
		explanation_message] 
		
	else:
		failed_questions += 1
		var bad_new_message = _select_bad_new_message()
		
		return formated_text % [Colors.apply_color(bad_new_message, Colors.TYPES.ERROR),
		explanation_message] 
	

func valid_answer(answer: String) -> bool:
	return answer.is_valid_int() and (int(answer)>=1 and int(answer)<=4)
		
	
	

