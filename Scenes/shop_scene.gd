extends Node3D


var current_index : int = 0
var total_cards : int = 0
var card_to_open: Card

@onready var shop_container: PanelContainer = %ShopContainer
@onready var choose_button: TextureButton = $UI/ShopUI/MarginContainer/HBoxContainer/ChooseButton
@onready var coin_label: Label = $UI/ShopUI/MarginContainer/HBoxContainer2/CoinLabel


func _ready() -> void:
	total_cards = shop_container.get_child_count()
	change_to_another_card(0)

func _process(_delta: float) -> void:
	coin_label.text = str(DataManager.total_coin)

func _on_left_button_pressed() -> void:
	change_to_another_card(1)
	SoundManager.play_button_sound()

func _on_right_button_pressed() -> void:
	change_to_another_card(-1)
	SoundManager.play_button_sound()

func change_to_another_card(index_in: int) -> void:
	current_index = (current_index + index_in) % total_cards
	
	for card: Card in shop_container.get_children():
		card.hide()
		card.model_link.hide()
	
	card_to_open = shop_container.get_child(current_index)
	card_to_open.show()
	card_to_open.model_link.show()
	choose_button.disabled = card_to_open.id == DataManager.choosen_character

func _on_menu_button_pressed() -> void:
	SceneTransition.change_to_menu_scene()
	SoundManager.play_button_sound()

func _on_choose_button_pressed() -> void:
	SoundManager.play_button_sound()
	var char_id = card_to_open.id
	if DataManager.list_characters[char_id][1] == false:
		return
	DataManager.choosen_character = card_to_open.id
	change_to_another_card(0)
