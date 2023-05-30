extends CharacterBody2D

@onready var anim_tree = $AnimationTree
@onready var anim_state = anim_tree.get("parameters/playback")
@export var move_speed = 100
var input_movement

func _physics_process(delta):
	input_movement = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)	
	input_movement = input_movement.normalized()
	velocity = move_speed * input_movement
	update_animation(input_movement)
	move_and_slide() 
	update_movement()
	

func update_animation(move_input : Vector2):
	if move_input != Vector2.ZERO:
		anim_tree.set("parameters/idle/blend_position", move_input)
		anim_tree.set("parameters/walk/blend_position", move_input)
		

func update_movement():
	if velocity != Vector2.ZERO:
		anim_state.travel("walk")
	else:
		anim_state.travel("idle")
