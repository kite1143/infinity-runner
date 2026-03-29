extends State
class_name SitIdleState

@export var sit_up_state: SitUpState
@export var dash_left_state: DashLeftState
@export var dash_right_state: DashRightState

@onready var sit_timer: Timer = $SitTimer

func enter() -> void:
	state_machine.animation_player.play(
		'player_animations/Lie_Idle'
	)
	sit_timer.start()

func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("sit"):
		sit_timer.start()
	
	if Input.is_action_just_pressed("dash_left") and state_machine.character_base.target_lane_x > -3:
		state_machine.change_state(dash_left_state.name)
	
	if Input.is_action_just_pressed("dash_right") and state_machine.character_base.target_lane_x < 3:
		state_machine.change_state(dash_right_state.name)

func exit() -> void:
	sit_timer.stop()


func _on_sit_timer_timeout() -> void:
	state_machine.change_state(sit_up_state.name)
