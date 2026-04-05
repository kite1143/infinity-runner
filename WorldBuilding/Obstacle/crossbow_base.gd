extends Node3D

@export var trigger_area: Area3D
@onready var arrow: Node3D = $arrow
@onready var arrow_shoot_player: AudioStreamPlayer3D = $ArrowShootPlayer

func _ready() -> void:
	if trigger_area:
		trigger_area.area_entered.connect(trigger_crossbow)

func trigger_crossbow(_area: Area3D) -> void:
	if not arrow.is_active:
		arrow_shoot_player.play()
		arrow.is_active = true
