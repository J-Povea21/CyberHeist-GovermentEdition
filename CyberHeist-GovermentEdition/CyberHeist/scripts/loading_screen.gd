extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	get_tree().get_nodes_in_group("Sonido")[0].get_node("Click").play()
	get_tree().change_scene_to_file("res://screens/main_screen.tscn")
	$AnimationPlayer.play("fade_in")
