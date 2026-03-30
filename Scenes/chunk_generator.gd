extends Node3D

@export var chunk_size: float = 72.0
@export var list_chunks: Array[PackedScene]
@export var number_of_chunk_generate_at_start : int = 3

var player: Player

var start_z_position: float = -72
var z_pos_to_generate: float

func _ready() -> void:
	player = get_tree().get_first_node_in_group('Player')
	
	z_pos_to_generate = start_z_position
	for i in range(number_of_chunk_generate_at_start):
		generate_next_chunk()
	
	print(z_pos_to_generate)

func _process(_delta: float) -> void:
	var second_chunk_child : Node3D = self.get_child(1)
	if player.global_position.z < second_chunk_child.global_position.z:
		generate_next_chunk()
		self.get_child(0).queue_free()

func generate_next_chunk() -> void:
	var chunk_to_add: PackedScene = list_chunks.pick_random()
	var chunk_instance: Node3D = chunk_to_add.instantiate()
	add_child(chunk_instance)
	chunk_instance.global_position = Vector3(0, 0, z_pos_to_generate)
	z_pos_to_generate -= chunk_size
	
