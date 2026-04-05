extends State
class_name SitUpState

@export var run_state: RunState
@export var jump_state: JumpIdleState
var is_going_to_jump: bool = false

func enter() -> void:
	state_machine.animation_player.play(
		'player_animations/Lie_StandUp'
	)
	await state_machine.animation_player.animation_finished
	
	if is_going_to_jump:
		print('lie up with jump')
		state_machine.change_state(jump_state.name)
		return
	state_machine.change_state(run_state.name)

func exit() -> void:
	is_going_to_jump = false
