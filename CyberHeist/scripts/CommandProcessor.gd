extends Node

"""
This is the command processor script. Here we manage all the
commands the player sends
"""

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
		_:	
			return Colors.apply_color(
			"%s: command not found" % command,
			Colors.TYPES.ERROR)
	

func help() -> String:
	return "List of commands: \n 1. run \n 2. help"

func run_file(action: String) -> String:
	if action.is_empty():
		return "Usage: run [filename]"
	
	match action:
		"heist.x86_64":
			return "The heist has started"
		_:
			return "run \'%s\': File not found" % action
	
					
