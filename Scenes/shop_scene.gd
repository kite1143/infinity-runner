extends Node3D


var current_index : int = 0
var total_cards : int = 0

@onready var shop_container: PanelContainer = %ShopContainer

func _ready() -> void:
	total_cards = shop_container.get_child_count()
	change_to_another_card(0)

func _on_left_button_pressed() -> void:
	change_to_another_card(1)

func _on_right_button_pressed() -> void:
	change_to_another_card(-1)

func change_to_another_card(index_in: int) -> void:
	current_index = (current_index + index_in) % total_cards
	
	for card: Card in shop_container.get_children():
		card.hide()
		card.model_link.hide()
	
	var card_to_open: Card = shop_container.get_child(current_index)
	card_to_open.show()
	card_to_open.model_link.show()

func _on_menu_button_pressed() -> void:
	SceneTransition.change_to_menu_scene()
