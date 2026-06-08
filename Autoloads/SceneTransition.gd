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

@onready var blur_background: ColorRect = $BlurBackground

func _ready() -> void:
	blur_background.hide()

func load_next_level(scene_path: String, settle_options: Dictionary = {}):
	blur_background.show()
	ResourceLoader.load_threaded_request(scene_path)
	
	while ResourceLoader.load_threaded_get_status(scene_path) == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		await get_tree().process_frame
		
	var packed_scene = ResourceLoader.load_threaded_get(scene_path)
	blur_background.hide()
	SceneManager.change_scene(packed_scene, settle_options)

func change_to_menu_scene() -> void:
	#SceneManager.change_scene(
		#menu_scene_path,
		#{ "pattern": "scribbles", "pattern_leave": "squares" }
	#)
	
	load_next_level(menu_scene_path, { "pattern": "scribbles", "pattern_leave": "squares" })

func change_to_shop_scene() -> void:
	#SceneManager.change_scene(
		#shop_scene_path,
		#{ "pattern": "scribbles", "pattern_leave": "squares" }
	#)
	load_next_level(shop_scene_path, { "pattern": "scribbles", "pattern_leave": "squares" })

func change_to_game_play() -> void:
	#SceneManager.change_scene(
		#main_game_path,
		#{ "pattern": "curtains", "pattern_leave": "squares" }
	#)
	load_next_level(main_game_path, { "pattern": "curtains", "pattern_leave": "squares" })

func change_to_result_scene() -> void:
	#SceneManager.change_scene(
		#result_scene_path,
		#{ "pattern": "curtains", "pattern_leave": "squares" }
	#)
	load_next_level(result_scene_path, { "pattern": "curtains", "pattern_leave": "squares" })
