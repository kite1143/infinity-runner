extends Node3D

@export_enum('Walking_A', 'Walking_B', 'Walking_C') 
var walking_way: String

@onready var animation_player: AnimationPlayer = $Skeleton_Minion/AnimationPlayer

func start_walking() -> void:
	if walking_way:
		animation_player.play(walking_way)
