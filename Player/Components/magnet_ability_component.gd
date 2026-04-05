extends Area3D

@export var player: Player

@export var blink_threshold: float = 3.0
@export var blink_speed: float = 8.0

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

func _on_duration_timer_timeout() -> void:
	self.hide()
	is_active = false
