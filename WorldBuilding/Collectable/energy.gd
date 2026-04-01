extends Area3D
class_name Energy

func _on_body_entered(body: Player) -> void:
	if body is not Player:
		return
	
	GameManager.energy += 1
	queue_free()
