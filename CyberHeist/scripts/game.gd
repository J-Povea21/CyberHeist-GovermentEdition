extends Control

### This is the main script, our UI ###

## SCENES ##
const GAME_OVER = preload("res://screens/game_over.tscn")
const YOU_WIN = 'NotReadyYet'

# Here we're going to make a conection with the command processor
@onready var command_processor = $CommandProcessor

# And here we make the connection with the terminal view
@onready var terminal= $Background/MarginContainer/Rows/TerminalInfo

@onready var cml_char = $Background/MarginContainer/Rows/InputArea/InputContainer/CMLChar
func _ready() -> void:
	
	# First, we connect the signals from our QuestionProcessor
	QuestionProcessor.player_discovered.connect(_player_discovered)
	QuestionProcessor.player_wins.connect(_player_wins)
	
	# Now we modify the cml tag/char with the player name
	cml_char.text = Global.CML_CHAR
	
	terminal.create_response(DataReader.messages['init'])
	

func command_submited(new_text: String) -> void:
	
	if new_text != "":
		$CommandSent.play()
		# Now, we create an instance of the scene
		
		var response = command_processor.process_command(new_text)
		terminal.create_response_with_input(response, new_text)		

func _player_discovered():
	get_tree().change_scene_to_packed(GAME_OVER)

func _player_wins():
	print('The player just win!')
