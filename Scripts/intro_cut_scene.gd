extends Node2D

@export var max_cracks = 9
var taps = -1
@onready var cracks = $CrackProgress
@onready var button = $ButtonGUI
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	cracks.visible = false
	$Explosion.visible = false
	$Explosion.frame = 0
	$BlackFade.color.a = 0
	button.play()
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("Space"):
		var rand = rng.randi_range(0, 3)
		match rand:
			0:$AudioStreamPlayer2D.play()
			1:$AudioStreamPlayer2D2.play()
			_:$AudioStreamPlayer2D3.play()
		taps += 1
		if taps >= 0:
			cracks.visible = true
			cracks.frame = taps
		if cracks.frame >= max_cracks:
			$Explosion.visible = true
			$Explosion.play()
			$AnimationPlayer.play("fade_out")
			$AudioStreamPlayer2D4.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func switch_to_cut_scene():
	get_tree().change_scene_to_file("res://Scenes/open_cut_scene.tscn")
