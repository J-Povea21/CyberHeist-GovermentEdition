extends Node2D

# If the restart button is pressed, we go back to the terminal
func _restart_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://screens/game.tscn")

func _quit_btn_pressed() -> void:
	get_tree().quit()


func _quit_btn_mouse_entered() -> void:
	$HoverButtonSfx.play()


func _restart_btn_mouse_entered() -> void:
	$HoverButtonSfx.play()
