extends Node2D

## NEXT SCENE ##
const COUNTRY_TO_ATTACK_SCENE = preload("res://screens/attack_screen.tscn")
@onready var name_input = $TextureRect/PanelContainer/NameInput

func _ready():
	
	# We grab focus once the node is ready
	name_input.grab_focus()
	
	$AnimationPlayer.play("fade_out")
	
	for button in get_tree().get_nodes_in_group("flags_buttons"):
		button.connect("pressed",func(): _flag_button_pressed(button))

func _flag_button_pressed(button_pressed: BaseButton):
	
	# We take the three first chars of the button name which contains the
	# country name. This country is assigned to the global variable
	Global.HACKER_COUNTRY = button_pressed.name.substr(0, 3)
	
	Global.HACKER_NAME = name_input.text
	Global.update_CML_CHAR()
	
	# And finally we change the scene
	get_tree().change_scene_to_packed(COUNTRY_TO_ATTACK_SCENE)
	$AnimationPlayer2.play("fade_in")
