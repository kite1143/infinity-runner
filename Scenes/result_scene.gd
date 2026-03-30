extends Control

@onready var watch_ad_container: PanelContainer = $WatchAdContainer

func _on_reset_button_pressed() -> void:
	SceneTransition.change_to_game_play()

func _on_menu_button_pressed() -> void:
	SceneTransition.change_to_menu_scene()

func _on_continue_button_pressed() -> void:
	watch_ad_container.show()

func _on_cancel_button_pressed() -> void:
	watch_ad_container.hide()
