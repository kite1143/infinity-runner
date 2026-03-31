extends Node3D
class_name BoostComponent

signal start_boost
signal end_boost
@onready var duration_timer: Timer = $DurationTimer

func trigger() -> void:
	start_boost.emit()
	duration_timer.start()

func _on_duration_timer_timeout() -> void:
	end_boost.emit()
