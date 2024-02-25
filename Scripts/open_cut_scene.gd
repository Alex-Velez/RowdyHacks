extends Node2D

var fade_speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player/PlayerTextBox.active = true
	$AnimationPlayer.play("black_fade")
	$AudioStreamPlayer2D.play()
	pass # Replace with function body.

func _input(event):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func switch_to_world():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_player_text_box_text_completed():
	$AnimationPlayer.play("player_to_chr2")
	$Player/PlayerTextBox.active = false
	$Character/ChrcTextBox.active = true
	pass # Replace with function body.


func _on_chrc_text_box_text_completed():
	$AnimationPlayer.play("fade_out")
	pass # Replace with function body.
