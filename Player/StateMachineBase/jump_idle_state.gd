extends State
class_name JumpIdleState

@export var run_state: RunState
@export var sit_state: SitIdleState
@export var swipe_detection: SwipeDetection
@onready var jump_land_sound_player: AudioStreamPlayer = $JumpLandSoundPlayer
@onready var jump_sound_player: AudioStreamPlayer = $JumpSoundPlayer

var is_going_to_sit: bool = false

func enter() -> void:
	jump_sound_player.play()
	is_going_to_sit = false
	state_machine.character_base.velocity.y = state_machine.character_base.jump_force
	state_machine.animation_player.play(
		'player_animations/Jump_Idle'
	)
	if swipe_detection:
		swipe_detection.swipe_down.connect(going_to_sit)

func update(_delta: float) -> void:
	if state_machine.character_base.velocity.y == 0:
		if not state_machine.character_base.is_alive:
			return
		jump_land_sound_player.play()
		
		if not is_going_to_sit:
			state_machine.change_state(run_state.name)
		else:
			state_machine.change_state(sit_state.name)

func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed('sit'):
		going_to_sit()

func going_to_sit() -> void:
	is_going_to_sit = true
	state_machine.character_base.velocity.y = -30

func exit() -> void:
	if swipe_detection:
		swipe_detection.swipe_down.disconnect(going_to_sit)
