extends Area3D

func _on_body_entered(body: CharacterBody3D) -> void:
	if body is not Player:
		return
	GameManager.potion_active.emit()
	queue_free()
