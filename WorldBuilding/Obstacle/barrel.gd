extends RigidBody3D

@export var trigger_range: Area3D
@onready var drop_sound: AudioStreamPlayer3D = $DropSound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if trigger_range:
		trigger_range.body_entered.connect(trigger_barrel)

func trigger_barrel(body: Player) -> void:
	if body is not Player:
		return
	freeze = false

func _on_body_entered(body: Node) -> void:
	drop_sound.play()
