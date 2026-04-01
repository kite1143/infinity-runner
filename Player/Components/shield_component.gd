extends Area3D
class_name ShieldComponent

@onready var duration_timer: Timer = $DurationTimer

var is_active: bool = false

func _ready() -> void:
	GameManager.shield_active.connect(trigger)

func _on_body_entered(body: Node3D) -> void:
	if is_active == false:
		return
	
	if body.is_in_group('Obstacle') or body.is_in_group('Enemy'):
		body.queue_free()
		duration_timer.stop()
		deactive()

func _on_area_entered(area: Area3D) -> void:
	if is_active == false:
		return
	
	if area.is_in_group('Obstacle') or area.is_in_group('Enemy'):
		area.queue_free()
		duration_timer.stop()
		deactive()

func trigger() -> void:
	self.show()
	is_active = true
	duration_timer.start()

func deactive() -> void:
	self.hide()
	is_active = false

func _on_duration_timer_timeout() -> void:
	deactive()
