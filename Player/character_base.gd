extends CharacterBody3D

var target_lane_x: float = 0.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * 3 * delta
	movement()
	move_and_slide()

func movement() -> void:
	if Input.is_action_just_pressed('dash_left') and target_lane_x > -3:
		target_lane_x -= 3
		start_dash_tween()
	elif Input.is_action_just_pressed('dash_right') and target_lane_x < 3:
		target_lane_x += 3
		start_dash_tween()

func start_dash_tween() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(
		self,
		'global_position:x',
		target_lane_x,
		0.2
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
