extends Control

# Here we load the data of our command response scene
const CommandResponseSCN = preload("res://commands_responses.tscn")

# Before creating a response, we make sure CommandHistory is ready
@onready var command_history = $Background/MarginContainer/Rows/TerminalInfo/Scroll/CommandsHistory


func command_submited(new_text: String) -> void:
	
	if new_text != "":
		# Now, we create an instance of the scene
		var command_response_object = CommandResponseSCN.instantiate()
		
		command_response_object.set_text(new_text, 'Here will go response to this command!')
		command_history.add_child(command_response_object)
	
	
