extends Node2D

const scroll_speed = 100
var finish_setup = false

# Called when the node enters the scene tree for the first time.
func _ready():
	finish_setup = false
	$AnimationPlayer.play("fade_in")
	var screen_width = get_viewport().size.x
	$ParallaxBackground/ParallaxLayer.motion_mirroring.x = screen_width
	$ParallaxBackground/ParallaxLayer2.motion_mirroring.x = screen_width
	$ParallaxBackground/ParallaxLayer3.motion_mirroring.x = screen_width
	$ParallaxBackground/ParallaxLayer4.motion_mirroring.x = screen_width
	$ActionOptions/Q.play()
	$ActionOptions/E.play()
	pass # Replace with function body.

func _input(event):
	if finish_setup:
		if event.is_action_pressed("Q"):
			print("start battle")
			pass
		elif event.is_action_pressed("E"):
			get_tree().change_scene_to_file("res://Scenes/world.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground/ParallaxLayer.motion_offset.x += scroll_speed * delta
	$ParallaxBackground/ParallaxLayer2.motion_offset.x += scroll_speed * 2 * delta
	$ParallaxBackground/ParallaxLayer3.motion_offset.x += scroll_speed * 3 * delta
	$ParallaxBackground/ParallaxLayer4.motion_offset.x += scroll_speed * 4 * delta
	pass


func _on_text_box_text_completed():
	$AnimationPlayer.play("setup_battle")
	finish_setup = true
	pass # Replace with function body.

