extends MarginContainer

# In this script we manage the command response view

@onready var response_label = $Rows/Response
@onready var input_label = $Rows/CommandHistory

func set_text(response: String, input: String = '') -> void:
	
	if input == '':
		input_label.queue_free()
	else:	
		input_label.text = Colors.apply_color(
			'ether@cyhst:~$ '
			,Colors.TYPES.SUCCESS) \
			+ input
		
	response_label.text = response
	
	
