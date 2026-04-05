extends Area3D

@onready var collect_sound: AudioStreamPlayer3D = $CollectSound

func _on_body_entered(body: CharacterBody3D) -> void:
	if body is not Player:
		return
	self.hide()
	collect_sound.play()
	GameManager.potion_active.emit()
	await collect_sound.finished
	queue_free()
