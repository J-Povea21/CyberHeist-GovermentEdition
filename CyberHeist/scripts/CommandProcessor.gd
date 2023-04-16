extends Node

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
			return run_file(command_action)
		_:	
			return "%s: command not found" % command

func run_file(action: String) -> String:
	if action.is_empty():
		return "Usage: run [filename]"
	
	match action:
		"heist.x86_64":
			return "The heist has started"
		_:
			return "run \'%s\': File not found" % action
	
					
