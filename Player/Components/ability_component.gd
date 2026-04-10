extends Node3D
class_name PlayerAbility

@export_group('Ability Choose')
@export var magnet_ability: bool = false
@export var shield_ability: bool = false
@export var potion_boost_ability: bool = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed() and event.is_double_click():
			trigger_ability()
	
	if event.is_action_pressed("use_ability"):
		trigger_ability()

func trigger_ability() -> void:
	if not GameManager.energy == GameManager.total_energy:
		return
	
	GameManager.energy = 0
	
	if magnet_ability:
		GameManager.magnet_active.emit()
	
	if shield_ability:
		GameManager.shield_active.emit()
	
	if potion_boost_ability:
		GameManager.potion_active.emit()
