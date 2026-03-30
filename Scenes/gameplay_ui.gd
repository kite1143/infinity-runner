extends CanvasLayer

@onready var pause_menu: Control = %PauseMenu

func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	SceneTransition.change_to_menu_scene()

func _on_continue_button_pressed() -> void:
	get_tree().paused = false
	pause_menu.hide()

func _on_pause_button_pressed() -> void:
	get_tree().paused = true
	pause_menu.show()

func _on_reset_button_pressed() -> void:
	get_tree().paused = false
	SceneManager.reload_scene()
