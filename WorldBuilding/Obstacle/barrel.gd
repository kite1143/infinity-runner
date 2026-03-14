extends RigidBody3D

@export var trigger_range: Area3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if trigger_range:
		trigger_range.body_entered.connect(trigger_barrel)

func trigger_barrel(body: Player) -> void:
	freeze = false
