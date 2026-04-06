extends State
class_name SitIdleState

@export var jump_state: JumpIdleState
@export var run_state: RunState
@export var swipe_detection: SwipeDetection

@onready var sit_timer: Timer = $SitTimer
var is_going_to_jump : bool = false

func enter() -> void:
	if swipe_detection:
		swipe_detection.swipe_up.connect(going_to_jump)
		swipe_detection.swipe_down.connect(sit_timer.start)
	
	sit_timer.start()
	state_machine.animation_player.play(
		'player_animations/Lie_Down'
	)
	await state_machine.animation_player.animation_finished
	state_machine.animation_player.play(
		'player_animations/Lie_Idle'
	)

func update(_delta: float) -> void:
	if Input.is_action_just_pressed("sit"):
		sit_timer.start()
	if Input.is_action_just_pressed('jump'):
		going_to_jump()

func going_to_jump() -> void:
	sit_timer.stop()
	is_going_to_jump = true
	sit_up()

func exit() -> void:
	sit_timer.stop()
	is_going_to_jump = false
	if swipe_detection:
		swipe_detection.swipe_up.disconnect(going_to_jump)
		swipe_detection.swipe_down.disconnect(sit_timer.start)

func _on_sit_timer_timeout() -> void:
	sit_up()

func sit_up() -> void:
	state_machine.animation_player.play(
		'player_animations/Lie_StandUp'
	)
	await state_machine.animation_player.animation_finished
	
	if is_going_to_jump:
		print('lie up with jump')
		state_machine.change_state(jump_state.name)
		return
	state_machine.change_state(run_state.name)
