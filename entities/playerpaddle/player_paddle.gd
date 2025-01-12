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

	if Input.is_action_pressed("move_up"):
		position.y -= SPEED

	if Input.is_action_pressed("move_down"):
		position.y += SPEED

	position.y = clamp(position.y, top_limit, bottom_limit)

	global_position = position
