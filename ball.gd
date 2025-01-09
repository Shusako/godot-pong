extends RigidBody2D
class_name Ball

@export var LAUNCH_SPEED: float = 20000
@export var DirectionHintLabel: Label

var starting_direction: Vector2 = Vector2(
	randi_range(-1000, 1000) / 1000.0,
	randi_range(-200, 200) / 1000.0
).normalized()

var target_speed: float = 850

func _ready():
	print("Ball ready")
	DirectionHintLabel.rotation = starting_direction.angle()

func _physics_process(delta):
	# keep velocity up
	var velocity = linear_velocity
	var target_velocity = velocity.normalized() * target_speed
	var new_velocity = velocity.slerp(target_velocity, 0.2)
	linear_velocity = new_velocity

func launch():
	print("Launch")
	DirectionHintLabel.hide()
	apply_central_force(starting_direction * LAUNCH_SPEED)
