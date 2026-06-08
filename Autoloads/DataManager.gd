extends Node

const SAVE_PATH: String = "user://player_data.json"

#[scene, bought_or_not]
var list_characters: Dictionary = {
	'knight': [preload("uid://beyrwfqtusi46"), true],
	'mage': [preload("uid://c0ve63vvr4j73"), false],
	'barbarian': [preload("uid://cpbl6j3hkvwx1"), false]
}

var choosen_character: String = 'knight'
var total_coin: int = 0

#[bus_name, volume]
var sound_list_volume = {
	'Master': 1.0,
	'Music': 1.0,
	'Sfx': 1.0
}

var highscore: float = 0

func _ready() -> void:
	load_data()

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		save_data()


func save_data() -> void:
	var characters_save_state: Dictionary = {}
	for key in list_characters:
		characters_save_state[key] = list_characters[key][1]
	
	var save_dict: Dictionary = {
		"characters_unlocked": characters_save_state,
		"choosen_character": choosen_character,
		"total_coin": total_coin,
		"sound_list_volume": sound_list_volume,
		"highscore": highscore
	}
	
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_line(JSON.stringify(save_dict))
		file.close()
		print("Game saved successfully.")
	else:
		printerr("Failed to open save file for writing.")

func load_data() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
	
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		var json_string := file.get_as_text()
		file.close()
		
		var json := JSON.new()
		var error := json.parse(json_string)
		
		if error == OK:
			var data: Dictionary = json.get_data()
			
			if data.has("total_coin"):
				total_coin = data["total_coin"]
				
			if data.has("choosen_character"):
				choosen_character = data["choosen_character"]
				
			if data.has("highscore"):
				highscore = data["highscore"]
				
			if data.has("sound_list_volume"):
				var saved_volumes = data["sound_list_volume"]
				for bus in saved_volumes:
					if sound_list_volume.has(bus):
						sound_list_volume[bus] = saved_volumes[bus]
			
			if data.has("characters_unlocked"):
				var saved_characters = data["characters_unlocked"]
				for key in saved_characters:
					if list_characters.has(key):
						list_characters[key][1] = saved_characters[key]
