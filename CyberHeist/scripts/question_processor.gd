extends Node

## CUSTOM SIGNALS ##

signal player_discovered
signal player_wins

## CONSTANTS ##
const MAX_QUESTIONS: int = 14
const NUM_QUESTIONS_TO_SELECT: int = 10
const NUM_FAILED_QUESTIONS_TO_LOSE = 2

# In this array we're going to store the questions
var questions: Array[Dictionary] = []

var current_question: Dictionary = {}

var failed_questions: int = 0

var questions_counter: int = 0

func _ready() -> void:
	_select_questions()
	

## PUBLIC METHODS ##
func display_question() -> String:

	# We select a question and increase the question counter
	var question: Dictionary = questions[questions_counter]
	
	var is_within_bounds: bool = questions_counter != (len(questions) - 1)
	
	if is_within_bounds:
		questions_counter+= 1

		
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

func check_answer(answer: String) -> String:
	
	# The first thing we check is the player status - if it has 3 failed questions or at least 8 rigth questions -
	_check_player_status()
	
	# We get the explanation message of the question
	var explanation_message = current_question['explanation']
	var formated_text = "%s \n\n Explicación: %s \n"
	
	if int(answer) == int(current_question['answer']):	
		var progress_message = _select_progress_message()
		
		return formated_text %  [Colors.apply_color(progress_message, Colors.TYPES.SUCCESS),
		explanation_message] 
		
	else:
		failed_questions += 1
		var bad_new_message = _select_bad_new_message()
		
		if failed_questions == 1:
			var danger_sound = get_tree().get_nodes_in_group('commands')[1]
			danger_sound.play()
		
		return formated_text % [Colors.apply_color(bad_new_message, Colors.TYPES.ERROR),
		explanation_message] 
	

func is_valid_answer(answer: String) -> bool:
	return answer.is_valid_int() and (int(answer)>=1 and int(answer)<=4)

## PRIVATE METHODS ##

func _select_questions() -> void:
	
	# Temporal array where we store the number of the asked questions
	var already_selected_questions: Array[int] = []
	
	var question_number: int = 0
	
	var question : Dictionary = {}
	
	for i in range(NUM_QUESTIONS_TO_SELECT):
		question_number = randi() % MAX_QUESTIONS
		
		while (question_number in already_selected_questions) and (i<= NUM_QUESTIONS_TO_SELECT ):
			question_number = randi() % MAX_QUESTIONS
	
		# Once we know the question number is not repeated, we store it in already_selected_questions
		already_selected_questions.append(question_number)
		
		# And finally we add the question to the questions array
		question = DataReader.questions_data["q%s" %question_number]
		
		questions.append(question)

func _select_progress_message() -> String:
	return DataReader.messages['progress'].pick_random()

func _select_bad_new_message() -> String:
	return DataReader.messages['bad_news'].pick_random()

func _check_player_status() -> void:
	if failed_questions == NUM_FAILED_QUESTIONS_TO_LOSE:
		player_discovered.emit()
	elif questions_counter == NUM_QUESTIONS_TO_SELECT - 1:
		player_wins.emit()
	

