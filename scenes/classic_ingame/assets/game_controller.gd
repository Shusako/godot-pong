extends Node

@export var score_keeper: Node
@export var ball_scene: PackedScene

var timer: Timer

func _ready():
	score_keeper.connect("goal_made", Callable(self, "reset"))

	timer = $FreezeTimer
	timer.connect("timeout", Callable(self, "next_round"))

	reset()

func reset():
	timer.start()

	# Queue free all current balls
	for ball in get_tree().get_nodes_in_group("ball"):
		ball.queue_free()

	call_deferred("add_new_ball")

	print("Timer started")

func add_new_ball():
	var new_ball = ball_scene.instantiate()
	new_ball.add_to_group("ball")
	add_child(new_ball)

func next_round():
	print("Round start!")

	var ball = get_tree().get_nodes_in_group("ball")[0]
	ball.launch()
