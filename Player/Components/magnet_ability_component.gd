extends Area3D

@export var player: Player
@onready var duration_timer: Timer = $DurationTimer
var is_active: bool = false

func _ready() -> void:
	is_active = false
	GameManager.magnet_active.connect(trigger)

func _on_area_entered(area: Area3D) -> void:
	if not is_active:
		return
	
	if not area.is_in_group('Collectable'):
		return
	
	var tween: Tween = create_tween()
	tween.tween_property(
		area,
		'global_position',
		player.global_position,
		0.2
	)

func trigger() -> void:
	self.show()
	is_active = true
	duration_timer.start()

func _on_duration_timer_timeout() -> void:
	self.hide()
	is_active = false
