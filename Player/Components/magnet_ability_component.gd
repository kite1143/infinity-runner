extends Area3D

@export var player: Player
@onready var duration_timer: Timer = $DurationTimer
var is_active: bool = false

func _ready() -> void:
	is_active = false
	GameManager.magnet_active.connect(trigger)

func _on_area_entered(area: Coin) -> void:
	if not is_active:
		return
	
	if not area.is_in_group('Collectable') or not area is Coin:
		return
	
	area.is_magneted = true

func trigger() -> void:
	self.show()
	is_active = true
	duration_timer.start()

func _on_duration_timer_timeout() -> void:
	self.hide()
	is_active = false
