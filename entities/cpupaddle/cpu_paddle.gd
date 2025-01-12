extends StaticBody2D

@export var SPEED: float = 5

var top_limit: float
var bottom_limit: float

func _ready():
	var half_height: float = 0
	var collision_shape = $ColorRect
	if collision_shape:
		half_height = collision_shape.size.y / 2.0

	top_limit = half_height
	bottom_limit = get_viewport_rect().size.y - half_height

func _physics_process(delta):
	var position = global_position

	var balls = get_tree().get_nodes_in_group("ball")
	if balls.size() == 0:
		return
	var ball = balls[0] as RigidBody2D

	var move = ball.global_position.y - position.y
	move = clamp(move, -SPEED, SPEED)

	position.y += move
	position.y = clamp(position.y, top_limit, bottom_limit)

	global_position = position
