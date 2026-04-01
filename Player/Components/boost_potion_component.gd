extends Node3D
class_name BoostComponent

signal start_boost
signal end_boost

@onready var duration_timer: Timer = $DurationTimer
@export var boost_number: float = 1.5

func _ready() -> void:
	GameManager.potion_active.connect(trigger)

func trigger() -> void:
	start_boost.emit()
	duration_timer.start()

func _on_duration_timer_timeout() -> void:
	end_boost.emit()
