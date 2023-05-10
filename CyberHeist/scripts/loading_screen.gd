extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuMusic.play()

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://screens/main_screen.tscn")
	$AnimationPlayer.play("fade_in")

func _play_button_mouse_entered() -> void:
	$HoverButtonSfx.play()
