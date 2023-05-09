extends Node

"""
This is the command processor script. Here we manage all the
commands the player sends
"""
#This variable is the one we're going to use to check
# if the server has been started
var server_started = false

const GAME_OVER = preload("res://screens/game_over.tscn")

func process_command(input: String) -> String:

	# We format and split the input
	var formated_input = input.to_lower()
	var words = formated_input.split(" ", false)
	var number_of_words = words.size()
	
	# Now we get the command - first word -
	var command = words[0]
	
	var command_action = ""
	
	# If there is an action word, we get what's in words[1]
	if number_of_words > 1:
		command_action = words[1]
	
	match command:
		"run":
			return Colors.apply_color(
				run(command_action),
				Colors.TYPES.SYSTEM)
		"help":
			return Colors.apply_color(help(),
			Colors.TYPES.SYSTEM)
		"res":
			return Colors.apply_color(response(command_action)
				, Colors.TYPES.SYSTEM)
		_:	
			return Colors.apply_color(
			"%s: command not found" % command,
			Colors.TYPES.ERROR)
	

func help() -> String:
	return DataReader.messages['commands']

func _display_question() -> String:
	
	if !server_started:
		return DataReader.messages['server_not_started']
	else:
		return QuestionProcessor.display_question()
	
	
func response(answer: String) -> String:
	
	if !server_started:
		return DataReader.messages['server_not_started']
		
	elif !QuestionProcessor.valid_answer(answer):
		return DataReader.messages['unknown_answer'] % answer
	else:
		return "%s \n\n%s" % [QuestionProcessor.check_answer(answer),
		_display_question()]
	
	return "Please type a response"
		
func run(action: String) -> String:
	if action.is_empty():
		return "Usage: run [filename]"
	
	if server_started and action == 'server':
		return DataReader.messages['server_started']
	
	match action:
		"server":
			server_started = true
			return "%s \n\n%s" % [DataReader.messages[action],
					_display_question()]
		_:
			return "run \'%s\': File not found" % action
	
					
