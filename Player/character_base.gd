extends CharacterBody3D
class_name Player

@export var lane_size : float = 4.0

@onready var state_machine: StateMachine = $StateMachine
@onready var ray_cast_left: RayCast3D = $RayCastLeft
@onready var ray_cast_right: RayCast3D = $RayCastRight

var target_lane_x: float = 0.0
var is_alive: bool = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * 3 * delta
	movement()
	move_and_slide()

func movement() -> void:
	if not is_alive:
		return
	
	if Input.is_action_just_pressed('dash_left') and target_lane_x > -lane_size:
		if ray_cast_left.is_colliding():
			return
		target_lane_x -= lane_size
		start_dash_tween()
	elif Input.is_action_just_pressed('dash_right') and target_lane_x < lane_size:
		if ray_cast_right.is_colliding():
			return
		target_lane_x += lane_size
		start_dash_tween()

func start_dash_tween() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(
		self,
		'global_position:x',
		target_lane_x,
		0.2
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)


func _on_hurt_box_body_entered(body: Node3D) -> void:
	if body.is_in_group('Enemy') or body.is_in_group('Obstacle'):
		print('Enemy/Obstacle collided')
		state_machine.change_state('Death')
		is_alive = false
