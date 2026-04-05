extends Node3D
class_name ShieldComponent

@onready var duration_timer: Timer = $DurationTimer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var blink_threshold: float = 3.0
@export var blink_speed: float = 8.0

var is_active: bool = false

func _ready() -> void:
	GameManager.shield_active.connect(trigger)

func _process(_delta: float) -> void:
	if is_active and not duration_timer.is_stopped():
		if duration_timer.time_left <= blink_threshold:
			self.visible = int(duration_timer.time_left * blink_speed) % 2 == 0
		else:
			self.visible = true

func trigger() -> void:
	self.show()
	is_active = true
	duration_timer.start()
	animation_player.play("shield_effect")

func deactive() -> void:
	self.hide()
	is_active = false
	animation_player.stop()

func _on_duration_timer_timeout() -> void:
	deactive()
