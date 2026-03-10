extends State
class_name RunState

@export var dash_left_state: DashLeftState
@export var dash_right_state: DashRightState
@export var jump_state: JumpStartState
@export var sit_state: SitDownState

func enter() -> void:
	state_machine.animation_player.play('player_animations/Running_B')
	state_machine.character_base.velocity = Vector3(
		state_machine.character_base.velocity.x,
		state_machine.character_base.velocity.y,
		-10
	)

func handle_input(event: InputEvent) -> void:
	if state_machine.character_base.global_position.x >= 0:
		if event.is_action_pressed("dash_left"):
			state_machine.change_state(dash_left_state.name)
	
	if state_machine.character_base.global_position.x <= 0:
		if event.is_action_pressed("dash_right"):
			state_machine.change_state(dash_right_state.name)
	
	if event.is_action_pressed('jump'):
		state_machine.change_state(jump_state.name)
	
	if event.is_action_pressed("sit"):
		state_machine.change_state(sit_state.name)
