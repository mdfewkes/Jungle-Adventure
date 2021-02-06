extends KinematicBody2D

export var ACCELERATION = 1500
export var MAX_SPEED = 500
export var ROLL_SPEED = 120
export var FRICTION = 1000

var velocity = Vector2.ZERO
var input_vector = Vector2.ZERO

func _process(delta):
	input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if !input_vector.is_equal_approx(Vector2.ZERO):
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)
	
