extends Node

## ROOTS ##
var questions_path: String = 'res://data/questions.json'
var messages_path: String = 'res://data/console_messages.json'
var lore_path: String = 'res://data/context.txt'
var win_path: String = "res://data/win_message.txt"

var questions_data: Dictionary = {}
var messages: Dictionary = {}
var lore_text: String = ''
var win_message: String = ''

func _ready() -> void:
	lore_text = read_txt(lore_path)
	win_message = read_txt(win_path)
	questions_data = load_data(questions_path)
	messages = load_data(messages_path)
	
# In this function where're going to read the data from
# the json file
func load_data(file_path: String):
	
	if FileAccess.file_exists(file_path):
		var data = FileAccess.open(file_path, FileAccess.READ)
		var parsed_data = JSON.parse_string(data.get_as_text())
		
		if parsed_data is Dictionary:
			return parsed_data	
		else:
			print('There\'s an error with the data format')
			
	else:
		print('Seems like the file \'questions\'doesn\'\'t exist')
		
func read_txt(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	var text = file.get_as_text()
	return text
	
