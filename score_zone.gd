extends Area2D
class_name ScoreZone

var score_callback: Callable

func register_callback(callable: Callable):
	connect("body_entered", Callable(self, "_on_body_entered"))
	score_callback = callable

func _on_body_entered(body):
	if body is RigidBody2D and body.is_in_group("ball"):  # Assuming Ball is a RigidBody2D and in "ball" group
		print("SCORE!")
		if score_callback:
			score_callback.call()
