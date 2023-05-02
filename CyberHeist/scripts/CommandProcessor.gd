extends Node

"""
This is the command processor script. Here we manage all the
commands the player sends
"""
#This variable is the one we're going to use to check
# if the server has been started
var server_started = false

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
				run_file(command_action),
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

func response(answer: String) -> String:
	if server_started:
		if answer.is_empty():
			return 'Please enter an answer'
		else:
			return QuestionProcessor.display_question()
		
			
	return 'The server is not started yet. Run \'run server\' '	
	
	
	
func run_file(action: String) -> String:
	if action.is_empty():
		return "Usage: run [filename]"
	
	if server_started:
		return DataReader.messages['server_started']
	
	match action:
		"server":
			server_started = true
			return DataReader.messages[action]
		_:
			return "run \'%s\': File not found" % action
	
					
