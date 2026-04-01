extends Node

signal magnet_active
signal potion_active
signal shield_active

var score = 0
var coin = 0
var energy = 0
var time_scale = 1.0
var total_energy = 9

func start_new_game() -> void:
	reset_vars()
	SceneTransition.change_to_game_play()

func reset_vars() -> void:
	score = 0
	coin = 0
	energy = 0
	time_scale = 1.0

func continue_game() -> void:
	SceneTransition.change_to_game_play()

func player_death() -> void:
	SceneTransition.change_to_result_scene()
