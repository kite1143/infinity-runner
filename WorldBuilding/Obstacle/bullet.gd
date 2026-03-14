extends Node3D

@export var speed : float = 40.0

var is_active: bool = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_active:
		global_position.z += speed * delta
		
		if global_position.is_equal_approx(Vector3(global_position.x, global_position.y, 200.0)):
			queue_free()
