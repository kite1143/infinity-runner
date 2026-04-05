extends Node3D

@export var swing_deg: float = 50

@onready var pivot: Node3D = $wall_open_scaffold2/Pivot
@onready var swing_sound_player: AudioStreamPlayer3D = $SwingSoundPlayer

func _ready() -> void:
	swing(swing_deg)

func swing(deg) -> void:
	swing_sound_player.play()
	var tween: Tween = create_tween()
	tween.tween_property(
		pivot,
		'global_rotation_degrees:z',
		deg,
		.5
	)
	tween.tween_callback(swing.bind(-deg))
