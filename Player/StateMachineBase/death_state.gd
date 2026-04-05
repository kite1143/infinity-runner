extends State
class_name DeathState

@onready var collide_sound_player: AudioStreamPlayer = $CollideSoundPlayer

func enter() -> void:
	collide_sound_player.play()
	state_machine.animation_player.play(
		'player_animations/Death_A'
	)
	
	state_machine.character_base.velocity = Vector3.ZERO
	
	await get_tree().create_timer(1.0).timeout
	GameManager.player_death()
