extends Area3D

@onready var collect_sound: AudioStreamPlayer3D = $CollectSound

func _on_body_entered(body: Node3D) -> void:
	if body is not Player:
		return
	self.hide()
	collect_sound.play()
	GameManager.magnet_active.emit()
	await collect_sound.finished
	queue_free()
