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
		button.connect("mouse_entered", func(): _flag_button_mouse_entered())
func _flag_button_pressed(button_pressed: BaseButton) -> void:
	# We take the three first chars of the button name which contains the
	# country name. This country is assigned to the global variable
	var country_name= button_pressed.name.substr(0, 3)
	Global.set_hacker_country(country_name)
	Global.set_hacker_name(name_input.text)
	Global.set_CML_CHAR()
	
	# And finally we change the scene
	get_tree().change_scene_to_packed(COUNTRY_TO_ATTACK_SCENE)
	$AnimationPlayer2.play("fade_in")

func _flag_button_mouse_entered() -> void:
	$HoverButtonSfx.play()


func _background_music_finished() -> void:
	$BackgroundMusic.play()
