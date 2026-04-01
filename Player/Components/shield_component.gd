extends Node3D
class_name ShieldComponent

@onready var duration_timer: Timer = $DurationTimer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var is_active: bool = false

func _ready() -> void:
	GameManager.shield_active.connect(trigger)

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
