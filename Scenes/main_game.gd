extends Node3D

var player: Player
@onready var spawn_pos: Marker3D = $PlayerSpawn
@onready var chunk_generator: ChunkGenerator = $ChunkGenerator

@export var difficulty_curve: Curve

var last_run_score: int

func _ready() -> void:
	SoundManager.play_gameplay_music()
	player = (DataManager.list_characters[
		DataManager.choosen_character
	][0] as PackedScene).instantiate()
	
	add_child(player)
	player.global_position = spawn_pos.global_position
	player.global_scale(Vector3(1.5, 1.5, 1.5))
	
	chunk_generator.first_generation()
	
	if GameManager.score != 0 and not GameManager.new_run:
		last_run_score = GameManager.score

func _physics_process(_delta: float) -> void:
	GameManager.score = -player.global_position.z + 2*GameManager.coin + last_run_score
	var distance: float = -player.global_position.z
	Engine.time_scale = difficulty_curve.sample(distance)
