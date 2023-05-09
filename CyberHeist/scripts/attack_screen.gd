extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade_out")
	for button in get_tree().get_nodes_in_group("flags_buttons"):
		button.connect("pressed", _flag_button_pressed)

func _flag_button_pressed():
	get_tree().change_scene_to_file("res://screens/lore_screen.tscn")
	$AnimationPlayer.play("fade_in")

