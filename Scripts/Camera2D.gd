extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.position.x = get_viewport().size.x / 2
	self.position.y = get_viewport().size.y / 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
