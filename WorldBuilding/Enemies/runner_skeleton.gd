extends Node3D

@export var speed: float = 10
@export var trigger_range: Area3D
@onready var walking_sound_player: AudioStreamPlayer3D = $WalkingSoundPlayer
@onready var animation_player: AnimationPlayer = $Skeleton_Warrior/AnimationPlayer

var is_running: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if trigger_range:
		trigger_range.body_entered.connect(player_entered)

func _process(delta: float) -> void:
	if is_running:
		global_position.z += delta * speed

func player_entered(body: Player) -> void:
	if body is not Player:
		return
	is_running = true
	animation_player.play("Running_HoldingRifle")
	walking_sound_player.play()
