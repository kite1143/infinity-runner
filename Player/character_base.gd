extends CharacterBody3D
class_name Player

@export var lane_size : float = 4.0
@export var base_speed: float = 10.0
@export var base_jump_force: float = 15.0

@onready var state_machine: StateMachine = $StateMachine
@onready var ray_cast_left: RayCast3D = $RayCastLeft
@onready var ray_cast_right: RayCast3D = $RayCastRight
@onready var boost_potion_component: BoostComponent = $BoostPotionComponent
@onready var shield_component: ShieldComponent = $ShieldComponent

var target_lane_x: float = 0.0
var is_alive: bool = true
var boost_number: float = 1.0
var speed: float
var jump_force: float

func _ready() -> void:
	speed = base_speed
	jump_force = base_jump_force
	boost_potion_component.start_boost.connect(start_physic_boost)
	boost_potion_component.end_boost.connect(end_physic_boost)

func _process(delta: float) -> void:
	speed = base_speed * boost_number
	jump_force = base_jump_force * boost_number

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * 3 * delta
	movement()
	
	if is_alive:
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
		if not is_alive:
			return
		state_machine.change_state('Death')
		is_alive = false

func _on_hurt_box_area_entered(area: Area3D) -> void:
	if area.is_in_group('Enemy') or area.is_in_group('Obstacle'):
		if not is_alive:
			return
		state_machine.change_state('Death')
		is_alive = false

func start_physic_boost() -> void:
	boost_number = boost_potion_component.boost_number
	speed = base_speed * boost_number
	jump_force = base_jump_force * boost_number
	velocity.z = -speed
	boost_potion_component.show()

func end_physic_boost() -> void:
	boost_number = 1.0
	velocity.z = -speed
	boost_potion_component.hide()
