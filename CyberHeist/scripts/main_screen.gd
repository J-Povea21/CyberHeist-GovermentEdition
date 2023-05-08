extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade_out")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.




	


func _on_col_button_pressed():
	get_tree().change_scene_to_file("res://screens/attack_screen.tscn")
	$AnimationPlayer2.play("fade_in")

func _on_mex_button_pressed():
	get_tree().change_scene_to_file("res://screens/attack_screen.tscn")
	$AnimationPlayer2.play("fade_in")

func _on_arg_button_pressed():
	get_tree().change_scene_to_file("res://screens/attack_screen.tscn")
	$AnimationPlayer2.play("fade_in")

func _on_rus_button_pressed():
	get_tree().change_scene_to_file("res://screens/attack_screen.tscn")
	$AnimationPlayer2.play("fade_in")

func _on_usa_button_pressed():
	get_tree().change_scene_to_file("res://screens/attack_screen.tscn")
	$AnimationPlayer2.play("fade_in")

func _on_chi_button_pressed():
	get_tree().change_scene_to_file("res://screens/attack_screen.tscn")
	$AnimationPlayer2.play("fade_in")

func _on_can_button_pressed():
	get_tree().change_scene_to_file("res://screens/attack_screen.tscn")
	$AnimationPlayer2.play("fade_in")

func _on_ind_button_pressed():
	get_tree().change_scene_to_file("res://screens/attack_screen.tscn")
	$AnimationPlayer2.play("fade_in")

func _on_brz_button_pressed():
	get_tree().change_scene_to_file("res://screens/attack_screen.tscn")
	$AnimationPlayer2.play("fade_in")

func _on_ale_button_pressed():
	get_tree().change_scene_to_file("res://screens/attack_screen.tscn")
	$AnimationPlayer2.play("fade_in")
