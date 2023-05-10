extends Node2D

## NEW SCENE ##
const GAME_SCENE = preload("res://screens/game.tscn")

@onready var label_lore = $Label
@onready var ok_button = $Overlayer/OverLayer/OkBtn
@onready var animations = $Animation

# Called when the node enters the scene tree for the first time.
func _ready():
	animations.play("fade_out")
	label_lore.text = ''


func _lore_animation_finished(anim_name: StringName) -> void:
	
	if anim_name == 'fade_out':
		animations.play("lore_text_animation")
		label_lore.text = DataReader.lore_text % 	[Global.HACKER_NAME, 
													Global.HACKER_COUNTRY, 
													Global.COUNTRY_TO_ATTACK, 
													Global.COUNTRY_TO_ATTACK,
													]
	else:
		$Typing.stop()
		ok_button.show()

func _ok_button_pressed() -> void:
	get_tree().change_scene_to_packed(GAME_SCENE)
	animations.play("fade_in")


func _ok_btn_mouse_entered() -> void:
	$HoverButtonSfx.play()
