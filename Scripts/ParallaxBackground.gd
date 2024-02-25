extends ParallaxBackground

@export var speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	var screen_width = get_viewport().size.x
	$ParallaxLayer.motion_mirroring.x = screen_width
	$ParallaxLayer2.motion_mirroring.x = screen_width
	$ParallaxLayer3.motion_mirroring.x = screen_width
	$ParallaxLayer4.motion_mirroring.x = screen_width
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxLayer.motion_offset.x += speed * delta
	$ParallaxLayer2.motion_offset.x += speed * 2 * delta
	$ParallaxLayer3.motion_offset.x += speed * 3 * delta
	$ParallaxLayer4.motion_offset.x += speed * 4 * delta
	
	pass
