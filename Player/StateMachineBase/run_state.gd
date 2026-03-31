extends State
class_name RunState

@export var dash_left_state: DashLeftState
@export var dash_right_state: DashRightState
@export var jump_state: JumpIdleState
@export var sit_state: SitDownState

func enter() -> void:
	state_machine.animation_player.play('player_animations/Running_B')
	state_machine.character_base.velocity.z = -state_machine.character_base.speed

func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("dash_left") and state_machine.character_base.target_lane_x > -3:
		if state_machine.character_base.ray_cast_left.is_colliding():
			return
		state_machine.change_state(dash_left_state.name)
	
	if Input.is_action_just_pressed("dash_right") and state_machine.character_base.target_lane_x < 3:
		if state_machine.character_base.ray_cast_right.is_colliding():
			return
		state_machine.change_state(dash_right_state.name)
	
	if Input.is_action_just_pressed('jump') and state_machine.character_base.is_on_floor():
		state_machine.change_state(jump_state.name)
	
	if Input.is_action_just_pressed("sit"):
		state_machine.change_state(sit_state.name)
