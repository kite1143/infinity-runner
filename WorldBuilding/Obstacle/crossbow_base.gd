extends Node3D

@export var trigger_area: Area3D
@onready var arrow: Node3D = $arrow

func _ready() -> void:
	if trigger_area:
		trigger_area.body_entered.connect(trigger_crossbow)

func trigger_crossbow(body: Player) -> void:
	if body is not Player:
		return
	if not arrow.is_active:
		arrow.is_active = true
