extends Node

## ROOTS ##
var questions_path = 'res://data/questions.json'
var messages_path = 'res://data/console_messages.json'
var lore_path = 'res://data/Contex.txt'

var questions_data = {}
var messages = {}
var lore_text = ""

func _ready() -> void:
	questions_data = load_data(questions_path)
	messages = load_data(messages_path)
	lore_text = read_txt(lore_path)
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
	
