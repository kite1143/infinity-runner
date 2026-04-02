extends Node3D

@export var swing_speed: float = 80

func _process(delta: float) -> void:
	global_rotation_degrees.y += swing_speed * delta
