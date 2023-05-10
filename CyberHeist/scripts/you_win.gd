extends Node2D

### MAIN SCENE. We want to go back here if the player press 'Restart' ##
const MAIN_SCREEN = preload("res://screens/main_screen.tscn")


@onready var animations = $Animation
@onready var restart_button = $CanvasLayer/OverLayer/Restart
@onready var quit_button = $CanvasLayer/OverLayer/Quit

func _ready() -> void:
	animations.play("fade_out")



func _animation_finished(anim_name: StringName) -> void:
	
	if anim_name == 'fade_out':
		animations.play("display_text")
		$FinalMessage.text = DataReader.win_message % Global.HACKER_NAME
	else:
		$Typing.stop()
		restart_button.show()
		quit_button.show()





func _quit_button_pressed() -> void:
	get_tree().quit()


func _restart_button_pressed() -> void:
	get_tree().change_scene_to_packed(MAIN_SCREEN)
	


func _quit_mouse_entered() -> void:
	$HoverButtonSfx.play()


func _restart_mouse_entered() -> void:
	$HoverButtonSfx.play()
