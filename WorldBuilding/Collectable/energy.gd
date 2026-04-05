extends Area3D
class_name Energy

@onready var energy_sound_player: AudioStreamPlayer3D = $EnergySoundPlayer

func _on_body_entered(body: Player) -> void:
	if body is not Player:
		return
	self.hide()
	energy_sound_player.play()
	await energy_sound_player.finished
	GameManager.energy += 1
	queue_free()
