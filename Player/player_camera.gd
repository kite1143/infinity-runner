extends Camera3D

var player: Player

func _ready() -> void:
	player = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.z = lerp(global_position.z, player.global_position.z + 2, 4.0*delta)
	global_position.x = lerp(global_position.x, player.global_position.x, 4.0*delta)
