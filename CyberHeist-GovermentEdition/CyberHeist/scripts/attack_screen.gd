extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade_out")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ale_buttonattack_pressed():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
	get_tree().change_scene_to_file("res://screens/lore_screen.tscn")
	$AnimationPlayer.play("fade_in")

func _on_brz_buttonattack_pressed():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
	get_tree().change_scene_to_file("res://screens/lore_screen.tscn")
	$AnimationPlayer.play("fade_in")

func _on_can_buttonattack_pressed():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
	get_tree().change_scene_to_file("res://screens/lore_screen.tscn")
	$AnimationPlayer.play("fade_in")

func _on_chi_buttonattack_pressed():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
	get_tree().change_scene_to_file("res://screens/lore_screen.tscn")
	$AnimationPlayer.play("fade_in")

func _on_arg_buttonattack_pressed():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
	get_tree().change_scene_to_file("res://screens/lore_screen.tscn")
	$AnimationPlayer.play("fade_in")

func _on_col_buttonattack_pressed():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
	get_tree().change_scene_to_file("res://screens/lore_screen.tscn")
	$AnimationPlayer.play("fade_in")

func _on_indi_buttonattack_pressed():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
	get_tree().change_scene_to_file("res://screens/lore_screen.tscn")
	$AnimationPlayer.play("fade_in")

func _on_mex_buttonattack_pressed():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
	get_tree().change_scene_to_file("res://screens/lore_screen.tscn")
	$AnimationPlayer.play("fade_in")

func _on_rus_buttonattack_pressed():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
	get_tree().change_scene_to_file("res://screens/lore_screen.tscn")
	$AnimationPlayer.play("fade_in")

func _on_usa_buttonattack_pressed():
	get_tree().get_nodes_in_group("Sonidos")[0].get_node("Click").play()
	get_tree().change_scene_to_file("res://screens/lore_screen.tscn")
	$AnimationPlayer.play("fade_in")

