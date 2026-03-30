extends Node

var score = 0
var coin = 0

func start_game() -> void:
	pass

func continue_game() -> void:
	pass

func player_death() -> void:
	SceneTransition.change_to_result_scene()
