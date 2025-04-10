extends Camera2D


@export var object_to_follow:Node2D

func _process(delta: float) -> void:
	if object_to_follow:
		position = object_to_follow.position
