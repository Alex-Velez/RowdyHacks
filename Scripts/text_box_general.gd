extends Node2D

signal text_completed

@export var text_sentences: Array[String] = [""]
var stage = -1
@export var active = false
@export var write_speed = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.visible_ratio = 0
	$Label.text = "..."
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("Space") && active:
		if $Label.visible_ratio < 1.0:
			$Label.visible_ratio = 1
		else:
			next_stage()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Label.visible_ratio < 1.0:
		$Label.visible_ratio += write_speed * delta
	pass


func next_stage():
	stage += 1
	if stage >= text_sentences.size():
		text_completed.emit()
		stage = 0
		active = false
	else:
		$Label.visible_ratio = 0
		$Label.text = text_sentences[stage]
		
func restart():
	stage = -1
	active = false
	$Label.visible_ratio = 0
	$Label.text = "..."
