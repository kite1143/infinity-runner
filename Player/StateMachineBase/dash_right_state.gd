extends State
class_name DashRightState

@export var dash_time: float = 0.2
@export var run_state: RunState

func enter() -> void:
	state_machine.animation_player.play('player_animations/Dodge_Right')
	await state_machine.animation_player.animation_finished
	state_machine.change_state(run_state.name)
	
