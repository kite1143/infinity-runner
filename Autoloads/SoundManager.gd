extends Node

@onready var button_sound_player: AudioStreamPlayer = $ButtonSoundPlayer
@onready var menu_music_player: AudioStreamPlayer = $MenuMusicPlayer
@onready var gameplay_music: Node = $GameplayMusic

func play_button_sound() -> void:
	button_sound_player.play()

func play_menu_music() -> void:
	for music_player: AudioStreamPlayer in gameplay_music.get_children():
		music_player.stop()
	menu_music_player.play()

func play_gameplay_music() -> void:
	menu_music_player.stop()
	for music_player: AudioStreamPlayer in gameplay_music.get_children():
		music_player.stop()
	var random_gameplay_music_player: AudioStreamPlayer = gameplay_music.get_children().pick_random()
	random_gameplay_music_player.play()
