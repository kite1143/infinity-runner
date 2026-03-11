extends State
class_name JumpIdleState

@export var run_state: RunState
@export var sit_down_state: SitDownState

var is_going_to_sit: bool = false

func enter() -> void:
	is_going_to_sit = false
	state_machine.character_base.velocity.y = 20
	state_machine.animation_player.play(
		'player_animations/Jump_Idle'
	)

func update(delta: float) -> void:
	if state_machine.character_base.velocity.y == 0:
		if not is_going_to_sit:
			state_machine.change_state(run_state.name)
		else:
			state_machine.change_state(sit_down_state.name)

func handle_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('sit'):
		is_going_to_sit = true
		state_machine.character_base.velocity.y = -30
