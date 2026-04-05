extends Area3D

@onready var collect_sound: AudioStreamPlayer3D = $CollectSound

func _on_area_entered(_area: Area3D) -> void:
	self.hide()
	collect_sound.play()
	GameManager.shield_active.emit()
	await collect_sound.finished
	queue_free()
