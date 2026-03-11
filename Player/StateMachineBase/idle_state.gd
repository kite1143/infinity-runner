extends State
class_name IdleState

@export var run_state: RunState

func update(delta: float) -> void:
	if Input.is_action_just_pressed('start_game'):
		state_machine.change_state(run_state.name)
