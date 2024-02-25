extends Control

@export var speed = 0.5
@onready var text = $Label
@export var text_stages: Array[String] = [""]

var stage = -1
@export var done = false
@export var active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	text.visible_ratio = 0
	done = false
	text.text = "..."
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("Space") && active:
		if not done:
			if text.visible_ratio < 1.0:
				text.visible_ratio = 1
			else:
				next_stage()

func _process(delta):
	if active && text.visible_ratio < 1.0:
		text.visible_ratio += speed * delta
	pass
	
func restart():
	stage = -1
	text.visible_ratio = 0
	done = false
	text.text = "..."
	
func next_stage():
	stage += 1
	if stage >= text_stages.size():
		stage = 0
		done = true
	else:
		text.text = text_stages[stage]
		text.visible_ratio = 0
