extends State
class_name DashLeftState

@export var run_state: RunState

func enter() -> void:
	var tween: Tween = create_tween()
	tween.finished.connect(
		func(): state_machine.change_state(run_state.name)
	)
	tween.tween_property(
		state_machine.character_base,
		'global_position',
		Vector3(
			state_machine.character_base.global_position.x-3,
			state_machine.character_base.global_position.y,
			state_machine.character_base.global_position.z
		),
		0.2
	)
	state_machine.animation_player.play('player_animations/Dodge_Left')
	
