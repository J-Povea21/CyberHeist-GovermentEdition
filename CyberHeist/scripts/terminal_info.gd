extends PanelContainer

# Here we load the data of our command response scene
const COMMAND_RESPONSE = preload("res://screens/commands_responses.tscn")


# Before creating a response, we make sure CommandHistory is ready
@onready var command_history = $Scroll/CommandsHistory

@onready var scroll = $Scroll

@onready var scrollbar = scroll.get_v_scroll_bar()



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scrollbar.connect("changed", _manage_auto_scroll)

### Public methods ###

func create_response(response_text: String) -> void:
	var response = COMMAND_RESPONSE.instantiate()
	_add_response(response)
	response.set_text(response_text)

func create_response_with_input(response_text: String,
 input: String) -> void:
	var command_response = COMMAND_RESPONSE.instantiate()
	_add_response(command_response)
	command_response.set_text(response_text, input)
		
		
### Private methods ###

func _manage_auto_scroll() -> void:
	scroll.scroll_vertical = scrollbar.max_value

func _add_response(response: Control) -> void:
	command_history.add_child(response)

