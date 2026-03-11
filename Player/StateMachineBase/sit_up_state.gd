extends State
class_name SitUpState

@export var run_state: RunState

func enter() -> void:
	state_machine.animation_player.play(
		'player_animations/Lie_StandUp'
	)
	await state_machine.animation_player.animation_finished
	state_machine.change_state(run_state.name)
