extends Area3D
class_name Coin

var is_magneted: bool = false
@onready var collect_sound: AudioStreamPlayer3D = $CollectSound

func _physics_process(delta: float) -> void:
	if is_magneted:
		var player: Player = get_tree().get_first_node_in_group('Player')
		global_position = global_position.lerp(player.center_point.global_position, 5*delta)

func _on_area_entered(_area: Area3D) -> void:
	self.hide()
	GameManager.coin += 1
	collect_sound.play()
	await collect_sound.finished
	queue_free()
