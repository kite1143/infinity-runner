extends Node3D

var player: Player
@onready var spawn_pos: Marker3D = $PlayerSpawn
@onready var chunk_generator: ChunkGenerator = $ChunkGenerator

func _ready() -> void:
	SoundManager.play_gameplay_music()
	player = (DataManager.list_characters[
		DataManager.choosen_character
	][0] as PackedScene).instantiate()
	
	add_child(player)
	player.global_position = spawn_pos.global_position
	player.global_scale(Vector3(1.5, 1.5, 1.5))
	
	chunk_generator.first_generation()

func _physics_process(_delta: float) -> void:
	GameManager.score = -player.global_position.z + 2*GameManager.coin
	var distance: float = -player.global_position.z
	if distance > 72*10:
		GameManager.time_scale = 1.2
	elif distance > 72*20:
		GameManager.time_scale = 1.4
	elif distance > 72*40:
		GameManager.time_scale = 1.5
	Engine.time_scale = GameManager.time_scale
