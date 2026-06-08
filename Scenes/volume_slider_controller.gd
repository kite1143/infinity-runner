extends HSlider

@export var bus_name: String
var bus_index: int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	value = DataManager.sound_list_volume[bus_name]

func _on_value_changed(_value: float) -> void:
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(_value)
	)
	DataManager.sound_list_volume[bus_name] = _value
