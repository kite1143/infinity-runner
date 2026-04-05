extends Node3D
class_name BoostComponent

signal start_boost
signal end_boost

@onready var duration_timer: Timer = $DurationTimer
@export var boost_number: float = 1.5
@export var blink_threshold: float = 3.0
@export var blink_speed: float = 8.0

var is_active: bool = false

func _ready() -> void:
	GameManager.potion_active.connect(trigger)

func _process(_delta: float) -> void:
	if is_active and not duration_timer.is_stopped():
		if duration_timer.time_left <= blink_threshold:
			self.visible = int(duration_timer.time_left * blink_speed) % 2 == 0
		else:
			self.visible = true

func trigger() -> void:
	start_boost.emit()
	is_active = true
	duration_timer.start()

func _on_duration_timer_timeout() -> void:
	end_boost.emit()
	is_active = false
