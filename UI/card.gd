extends MarginContainer
class_name Card

@export var char_name: String
@export var base_speed: float = 20.0
@export var skill_detail: String
@export var model_link: Node3D

@onready var name_label: Label = $VBoxContainer/NameLabel
@onready var speed_label: Label = $VBoxContainer/SpeedLabel
@onready var skill_label: Label = $VBoxContainer/SkillLabel
@onready var price_label: Label = $VBoxContainer/ChooseButton/PriceLabel
@onready var choose_button: TextureButton = $VBoxContainer/ChooseButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	name_label.text = char_name
	speed_label.text = str(base_speed)
	skill_label.text = skill_detail
