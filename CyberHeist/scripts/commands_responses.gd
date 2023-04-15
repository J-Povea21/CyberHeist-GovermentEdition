extends VBoxContainer

# In this script we're going to manage the responses to each command

func set_text(input: String, response: String) -> void:
	$CommandHistory.text = 'ether@cyhst:~$ ' + input
	$Response.text = response
	
	
