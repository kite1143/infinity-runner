extends CanvasLayer

@onready var setting_window: Control = $MarginContainer/SettingWindow
@onready var guide_window: Control = $MarginContainer/GuideWindow

func _on_setting_button_pressed() -> void:
	setting_window.visible = true

func _on_rule_button_pressed() -> void:
	guide_window.visible = true

func _on_turn_off_setting_button_pressed() -> void:
	setting_window.visible = false

func _on_turn_off_guide_button_pressed() -> void:
	guide_window.visible = false
