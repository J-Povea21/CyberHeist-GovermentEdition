extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#We use this function to 'grab focus' to the input line once the game window is open
	grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func enter_key_pressed(new_text: String) -> void:
	
	# Once a command was send, we clear the CML
	
	clear()
