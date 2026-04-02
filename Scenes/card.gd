extends MarginContainer
class_name Card

@export var id: String
@export var char_name: String
@export var base_speed: float = 20.0
@export var skill_detail: String
@export var price_to_buy: int = 1000
@export var model_link: Node3D

@onready var name_label: Label = $VBoxContainer/NameLabel
@onready var speed_label: Label = $VBoxContainer/SpeedLabel
@onready var buy_button: TextureButton = $VBoxContainer/BuyButton
@onready var skill_label: Label = $VBoxContainer/SkillLabel
@onready var price_label: Label = $VBoxContainer/BuyButton/PriceLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	name_label.text = char_name
	speed_label.text = str(base_speed)
	skill_label.text = skill_detail
	price_label.text = str(price_to_buy)
	buy_button.visible = not DataManager.list_characters[id][1]

func _on_buy_button_pressed() -> void:
	if DataManager.total_coin > price_to_buy:
		DataManager.total_coin -= price_to_buy
		DataManager.list_characters[id][1] = true
		buy_button.visible = false
