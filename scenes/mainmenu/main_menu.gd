extends Control

@export var classicScene: PackedScene
@onready var originalSize = self.size

func _process(delta: float) -> void:
	self.scale.x = get_viewport().get_visible_rect().size.x / originalSize.x
	self.scale.y = get_viewport().get_visible_rect().size.y / originalSize.y


func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(classicScene)
