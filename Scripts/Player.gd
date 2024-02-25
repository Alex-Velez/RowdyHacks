extends CharacterBody2D


const MAX_SPEED = 3000.0
const friction = 3
const JUMP_VELOCITY = -200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if is_on_floor():
		if Input.is_action_just_pressed("up"):
			velocity.y = JUMP_VELOCITY
		
		var direction = Input.get_axis("left", "right")
		
		if direction:
			velocity.x = direction * MAX_SPEED * delta
			$AnimatedSprite2D.play("move")
		else:
			velocity.x = lerp(velocity.x, 0.0, friction * delta)
			$AnimatedSprite2D.play("idle")
	else:
		velocity.y += gravity * delta
		if $AnimatedSprite2D.frame_progress < 1:
			$AnimatedSprite2D.play("jump")
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	
	
	

	move_and_slide()
