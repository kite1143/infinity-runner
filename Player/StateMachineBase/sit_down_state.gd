extends State
class_name SitDownState

@export var sit_idle_state: SitIdleState
@export var sit_up_state: SitUpState

func enter() -> void:
	state_machine.animation_player.play(
		'player_animations/Lie_Down'
	)
	await state_machine.animation_player.animation_finished
	state_machine.change_state(sit_idle_state.name)
