extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("scene_fade_in")
	$TutorialVisuals/W.play()
	$TutorialVisuals/A.play()
	$TutorialVisuals/S.play()
	$TutorialVisuals/D.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_cole_body_entered(body):
	get_tree().change_scene_to_file("res://Scenes/cole_battle.tscn")
	pass # Replace with function body.
