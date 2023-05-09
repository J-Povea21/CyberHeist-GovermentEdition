extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# If the restart button is pressed, we go back to the terminal
func _restart_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://screens/game.tscn")

func _quit_btn_pressed() -> void:
	get_tree().quit()
