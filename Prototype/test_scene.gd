extends Node2D

@onready var admob: Admob = $Admob
var is_initialized: bool = false
func _ready() -> void:
	admob.initialize()

func _on_button_pressed() -> void:
	if is_initialized:
		admob.load_rewarded_ad()
		await admob.rewarded_ad_loaded
		admob.show_rewarded_ad()


func _on_admob_initialization_completed(status_data: InitializationStatus) -> void:
	is_initialized = true
