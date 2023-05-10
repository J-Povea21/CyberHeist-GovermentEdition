extends Node2D

## NEW SCENE ##
const GAME_SCENE = preload("res://screens/game.tscn")

@onready var label_lore = $TextureRect/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()
	label_lore.text = DataReader.lore_text % [Global.HACKER_NAME, Global.HACKER_COUNTRY, Global.COUNTRY_TO_ATTACK, Global.COUNTRY_TO_ATTACK]
	$AnimationPlayer.play("lore_text_animation")
	
func _on_animation_player_animation_finished(anim_name):
	$AudioStreamPlayer.stop()
	get_tree().change_scene_to_packed(GAME_SCENE)
	
