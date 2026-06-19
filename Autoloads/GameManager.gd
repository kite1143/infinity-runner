@warning_ignore_start("unused_signal")
extends Node

signal magnet_active
signal potion_active
signal shield_active
signal shield_deactive

var score: float = 0.0
var coin: int = 0
var energy:int = 0:
	set(value):
		energy = min(value, total_energy)
var time_scale: float = 1.0
var total_energy: int = 5
var new_run: bool = true

func start_new_game() -> void:
	reset_vars()
	SceneTransition.change_to_game_play()

func reset_vars() -> void:
	score = 0
	coin = 0
	energy = 0
	time_scale = 1.0
	new_run = true
	

func continue_game() -> void:
	SceneTransition.change_to_game_play()

func player_death() -> void:
	SceneTransition.change_to_result_scene()
