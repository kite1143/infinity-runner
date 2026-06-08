extends Area3D

func _on_area_entered(_area: Area3D) -> void:
	GameManager.shield_deactive.emit()
