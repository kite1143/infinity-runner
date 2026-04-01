extends Node3D

var list_of_powerups: Array

func _ready() -> void:
	var is_delete_or_not = randi_range(0, 10)
	if is_delete_or_not > 3:
		queue_free()
	
	list_of_powerups = get_children()
	var random_powerups = list_of_powerups.pick_random()
	for powerup: Area3D in list_of_powerups:
		if powerup == random_powerups:
			continue
		powerup.queue_free()
