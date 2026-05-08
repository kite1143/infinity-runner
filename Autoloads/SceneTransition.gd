extends Node

var menu_scene_path : String = "res://Scenes/menu_scene.tscn"
var main_game_path : String = "res://Scenes/main_game.tscn"
var shop_scene_path : String = "res://Scenes/shop_scene.tscn"
var result_scene_path : String = "res://Scenes/result_scene.tscn"
#
#SceneManager.change_scene(
  #'res://demo/test2.tscn',
  #{ "pattern": "scribbles", "pattern_leave": "squares" }
#)

func change_to_menu_scene() -> void:
	SceneManager.change_scene(
		menu_scene_path,
		{ "pattern": "scribbles", "pattern_leave": "squares" }
	)

func change_to_shop_scene() -> void:
	SceneManager.change_scene(
		shop_scene_path,
		{ "pattern": "scribbles", "pattern_leave": "squares" }
	)

func change_to_game_play() -> void:
	SceneManager.change_scene(
		main_game_path,
		{ "pattern": "curtains", "pattern_leave": "squares" }
	)

func change_to_result_scene() -> void:
	SceneManager.change_scene(
		result_scene_path,
		{ "pattern": "curtains", "pattern_leave": "squares" }
	)
