extends Area3D
class_name Energy

@onready var energy_sound_player: AudioStreamPlayer3D = $EnergySoundPlayer

func _on_area_entered(_area: Area3D) -> void:
	self.hide()
	GameManager.energy += 1
	energy_sound_player.play()
	await energy_sound_player.finished
	queue_free()
