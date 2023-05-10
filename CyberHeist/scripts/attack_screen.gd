extends Node2D

var t = Global.HACKER_COUNTRY + "Btn"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade_out")
	for button in get_tree().get_nodes_in_group("flags_buttons"):
		button.connect("pressed", func(): _flag_button_pressed(button))

func _flag_button_pressed(button_pressed: BaseButton):
	Global.COUNTRY_TO_ATTACK = button_pressed.name.substr(0, 3)
	get_tree().change_scene_to_file("res://screens/lore_screen.tscn")
	$AnimationPlayer.play("fade_in")

