extends Node3D
@warning_ignore_start("unused_signal")

var current_index : int = 0
var total_cards : int = 0
var card_to_open: Card
var is_initialized: bool = false

@onready var shop_container: PanelContainer = %ShopContainer
@onready var choose_button: TextureButton = $UI/ShopUI/MarginContainer/HBoxContainer/ChooseButton
@onready var coin_label: Label = $UI/ShopUI/MarginContainer/HBoxContainer2/CoinLabel
@onready var admob: Admob = $Admob
@onready var morecoin_container: PanelContainer = $UI/MorecoinContainer

func _ready() -> void:
	admob.initialize()
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
	DataManager.save_data()


func _on_gain_coin_button_pressed() -> void:
	morecoin_container.show()

func _on_cancel_button_pressed() -> void:
	morecoin_container.hide()

func _on_accept_button_pressed() -> void:
	if is_initialized:
		admob.load_rewarded_ad()
		await admob.rewarded_ad_loaded
		admob.show_rewarded_ad()

func _on_admob_initialization_completed(status_data: InitializationStatus) -> void:
	is_initialized = true

func _on_admob_rewarded_ad_user_earned_reward(ad_info: AdInfo, reward_data: RewardItem) -> void:
	DataManager.total_coin += 250
