extends Control

@onready var revive_container: PanelContainer = $ReviveContainer
@onready var score_label: Label = $Panel/TextureRect/VBoxContainer2/ScoreLabel
@onready var coin_label: Label = $Panel/TextureRect/VBoxContainer2/HBoxContainer/CoinLabel
@onready var not_enough_coin_alert: PanelContainer = $NotEnoughCoinAlert
@onready var alert_timer: Timer = $NotEnoughCoinAlert/AlertTimer

func _ready() -> void:
	score_label.text = '%.2f' % GameManager.score
	coin_label.text = 'X%d' % GameManager.coin

func _on_reset_button_pressed() -> void:
	update_score_and_coin()
	SoundManager.play_button_sound()
	GameManager.start_new_game()

func _on_menu_button_pressed() -> void:
	update_score_and_coin()
	SoundManager.play_button_sound()
	SceneTransition.change_to_menu_scene()

func _on_continue_button_pressed() -> void:
	if DataManager.total_coin < 500:
		not_enough_coin_alert.show()
		alert_timer.start()
		return 
	
	revive_container.show()
	SoundManager.play_button_sound()

func _on_cancel_button_pressed() -> void:
	revive_container.hide()
	SoundManager.play_button_sound()

func _on_accept_button_pressed() -> void:
	DataManager.total_coin -= 500
	GameManager.continue_game()
	GameManager.new_run = false
	SoundManager.play_button_sound()

func update_score_and_coin() -> void:
	if GameManager.score > DataManager.highscore:
		DataManager.highscore = GameManager.score
	DataManager.total_coin += GameManager.coin
	DataManager.save_data()
	

func _on_alert_timer_timeout() -> void:
	not_enough_coin_alert.hide()
