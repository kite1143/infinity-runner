extends State
class_name SitUpState

@export var run_state: RunState
var runnable: bool = true

func enter() -> void:
	runnable = true
	state_machine.animation_player.play(
		'player_animations/Lie_StandUp'
	)
	await state_machine.animation_player.animation_finished
	if runnable:
		state_machine.change_state(run_state.name)

func exit() -> void:
	runnable = false
