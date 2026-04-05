extends CanvasLayer

@onready var pause_menu: Control = %PauseMenu
@onready var score_label: Label = $MarginContainer/VBoxContainer/ScoreLabel
@onready var coin_label: Label = $MarginContainer/VBoxContainer/HBoxContainer3/VBoxContainer/CoinLabel
@onready var energy_label: Label = $MarginContainer/VBoxContainer/HBoxContainer3/VBoxContainer2/EnergyLabel

func _process(_delta: float) -> void:
	score_label.text = "%.2f" % GameManager.score
	coin_label.text = str(GameManager.coin)
	energy_label.text = "%d/%d" % [GameManager.energy, GameManager.total_energy]

func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	SoundManager.play_button_sound()
	SceneTransition.change_to_menu_scene()

func _on_continue_button_pressed() -> void:
	get_tree().paused = false
	SoundManager.play_button_sound()
	pause_menu.hide()

func _on_pause_button_pressed() -> void:
	get_tree().paused = true
	SoundManager.play_button_sound()
	pause_menu.show()

func _on_reset_button_pressed() -> void:
	get_tree().paused = false
	SoundManager.play_button_sound()
	GameManager.reset_vars()
	SceneManager.reload_scene()
