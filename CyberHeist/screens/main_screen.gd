extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade_out")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_col_button_pressed():
	get_tree().change_scene_to_file("res://screens/attack_screen.tscn")


func _on_mex_button_pressed():
	get_tree().change_scene_to_file("res://screens/attack_screen.tscn")



