extends State
class_name IdleState

@export var run_state: RunState

func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed('start_game'):
		state_machine.change_state(run_state.name)
