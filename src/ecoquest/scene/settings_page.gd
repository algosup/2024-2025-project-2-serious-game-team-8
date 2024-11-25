extends Node2D

var bus_index: int 

func _ready() -> void:
	# Get the audio bus index for "Menu Music"
	bus_index = AudioServer.get_bus_index("Menu Music")
	
	# Set the audio bus volume to the saved value
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(Global.music_slider_value)
	)
	
	# Initialize the slider's value to the saved value
	$"CanvasLayer/MusicSliderControl/Music Slider".value = Global.music_slider_value
	# Connect the slider's value_changed signal
	$"CanvasLayer/MusicSliderControl/Music Slider".value_changed.connect(_on_music_slider_value_changed)

func _on_music_slider_value_changed(value: float) -> void:
	# Update the global value
	Global.music_slider_value = value
	
	# Update the audio bus volume
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value)
	)

func _on_close_button_pressed() -> void:
	# Clean up the node
	queue_free()
