extends Node3D

@onready var player: Player = get_tree().get_first_node_in_group('Player')

func _physics_process(delta: float) -> void:
	GameManager.score = -player.global_position.z + 2*GameManager.coin
	var distance: float = -player.global_position.z
	if distance > 72*10:
		GameManager.time_scale = 1.2
	elif distance > 72*20:
		GameManager.time_scale = 1.4
	elif distance > 72*40:
		GameManager.time_scale = 1.5
	Engine.time_scale = GameManager.time_scale
