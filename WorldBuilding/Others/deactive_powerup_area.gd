extends Area3D

func _on_area_entered(area: Area3D) -> void:
	GameManager.shield_deactive.emit()
