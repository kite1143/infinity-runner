extends State
class_name IdleState

@export var run_state: RunState
@export var guide_window: Panel

func update(_delta: float) -> void:
	if Input.is_action_just_pressed('start_game'):
		state_machine.character_base.is_active = true
		state_machine.change_state(run_state.name)
		guide_window.hide()
