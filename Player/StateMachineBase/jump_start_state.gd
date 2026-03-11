extends State
class_name JumpStartState

@export var jump_idle_state: JumpIdleState
func enter() -> void:
	state_machine.animation_player.play(
		'player_animations/Jump_Start'
	)
	await state_machine.animation_player.animation_finished
	state_machine.change_state(jump_idle_state.name)
