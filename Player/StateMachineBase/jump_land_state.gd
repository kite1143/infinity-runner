extends State
class_name JumpLandState

@export var run_state: RunState

func enter() -> void:
	state_machine.animation_player.play(
		'player_animations/Jump_Land'
	)
	await state_machine.animation_player.animation_finished
	state_machine.change_state(run_state.name)
