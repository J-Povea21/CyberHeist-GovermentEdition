extends Control

# Here we load the data of our command response scene
const CommandResponseSCN = preload("res://commands_responses.tscn")

# Before creating a response, we make sure CommandHistory is ready
@onready var command_history = $Background/MarginContainer/Rows/TerminalInfo/Scroll/CommandsHistory

@onready var scroll = $Background/MarginContainer/Rows/TerminalInfo/Scroll

@onready var scrollbar = scroll.get_v_scroll_bar()

# Here we're going to make a conection with the command processor
@onready var command_processor = $CommandProcessor

func _ready() -> void:
	scrollbar.connect("changed", manage_auto_scroll)


func manage_auto_scroll() -> void:
	scroll.scroll_vertical = scrollbar.max_value


func command_submited(new_text: String) -> void:
	
	if new_text != "":
		# Now, we create an instance of the scene
		var command_response_object = CommandResponseSCN.instantiate()
		
		var response = command_processor.process_command(new_text)
		command_response_object.set_text(new_text, response)
		command_history.add_child(command_response_object)
	
	
