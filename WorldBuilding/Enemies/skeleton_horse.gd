extends Node3D

@export var trigger_area: Area3D
@export var speed: float = 5
@export var direction: float = 1.0

@onready var skeletons: Node3D = $Skeletons

var is_walking: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if trigger_area:
		trigger_area.body_entered.connect(player_trigger)

func _process(delta: float) -> void:
	if is_walking:
		global_position.x += speed * delta * direction

func player_trigger(body: Player) -> void:
	if body is not Player:
		return
	
	for child in skeletons.get_children():
		child.start_walking()
	is_walking = true
