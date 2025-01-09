extends Node2D
class_name ScoreKeeper

var player_score: int = 0
var cpu_score: int = 0

@export var player_score_label: Label
@export var cpu_score_label: Label
@export var cpu_score_zone: ScoreZone
@export var player_score_zone: ScoreZone

signal goal_made

func _ready():
	cpu_score_zone.register_callback(Callable(self, "cpu_scored"))
	player_score_zone.register_callback(Callable(self, "player_scored"))

func player_scored():
	emit_signal("goal_made")

	print("PLAYER SCORE REGISTERED!")
	player_score += 1
	player_score_label.text = str(player_score)

func cpu_scored():
	emit_signal("goal_made")

	print("CPU SCORE REGISTERED!")
	cpu_score += 1
	cpu_score_label.text = str(cpu_score)
