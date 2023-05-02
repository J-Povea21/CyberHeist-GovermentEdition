extends Control

### This is the main script, our UI ###


# Here we're going to make a conection with the command processor
@onready var command_processor = $CommandProcessor

# And here we make the connection with the terminal view
@onready var terminal= $Background/MarginContainer/Rows/TerminalInfo

func _ready() -> void:
	terminal.create_response(DataReader.messages['init'])
	

func command_submited(new_text: String) -> void:
	
	if new_text != "":
		$CommandSent.play()
		# Now, we create an instance of the scene
		
		var response = command_processor.process_command(new_text)
		terminal.create_response_with_input(response, new_text)		

