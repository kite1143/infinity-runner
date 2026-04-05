extends State
class_name RunState

@export var jump_state: JumpIdleState
@export var sit_state: SitIdleState
@onready var run_sound_player: AudioStreamPlayer = $RunSoundPlayer

func enter() -> void:
	run_sound_player.play()
	state_machine.animation_player.play('player_animations/Running_B')
	state_machine.character_base.velocity.z = -state_machine.character_base.speed

func handle_input(_event: InputEvent) -> void:
	
	if Input.is_action_just_pressed('jump') and state_machine.character_base.is_on_floor():
		state_machine.change_state(jump_state.name)
	
	if Input.is_action_just_pressed("sit"):
		state_machine.change_state(sit_state.name)

func exit() -> void:
	run_sound_player.stop()
