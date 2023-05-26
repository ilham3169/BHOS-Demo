extends CharacterBody2D

@export var move_speed : float = 70

func _physics_process(delta):
	
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	if Input.get_action_strength("shift") == 1:
		move_speed = 150
	else:
		move_speed = 70
	
	if input_direction.x == 0 and input_direction.y == 0:
		$AnimationPlayer.play("Idle")
	elif input_direction.x != 0 or input_direction.y != 0:
		$AnimationPlayer.play("Walk")
	velocity = input_direction * move_speed 

	if input_direction.x < 0:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
	move_and_slide()
