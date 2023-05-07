extends Node2D
@onready var label_lore = $TextureRect/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()
	label_lore.text = DataReader.lore_text
	$AnimationPlayer.play("lore_text_animation")
	
func _on_animation_player_animation_finished(anim_name):
	$AudioStreamPlayer.stop()
