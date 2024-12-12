extends Node2D

var music_bus_index: int
var sfx_bus_index: int

func _ready() -> void:
	# Get the audio bus indices for "Menu Music" and "SFX"
	music_bus_index = AudioServer.get_bus_index("Menu Music")
	sfx_bus_index = AudioServer.get_bus_index("SFX")  

	# Set the audio bus volume to the saved values
	AudioServer.set_bus_volume_db(
		music_bus_index,
		linear_to_db(Global.music_slider_value)
	)
	AudioServer.set_bus_volume_db(
		sfx_bus_index,
		linear_to_db(Global.sfx_slider_value)
	)

	# Initialize the sliders' values to the saved values
	$"CanvasLayer/MusicSliderControl/Music Slider".value = Global.music_slider_value
	$CanvasLayer/MusicSliderControl/SFXSlider.value = Global.sfx_slider_value

	# Connect the slider's value_changed signals
	if not $"CanvasLayer/MusicSliderControl/Music Slider".is_connected("value_changed", Callable(self, "_on_music_slider_value_changed")):
			$"CanvasLayer/MusicSliderControl/Music Slider".value_changed.connect(_on_music_slider_value_changed)

	if not $CanvasLayer/MusicSliderControl/SFXSlider.is_connected("value_changed", Callable(self, "_on_sfx_slider_value_changed")):
			$CanvasLayer/MusicSliderControl/SFXSlider.value_changed.connect(_on_sfx_slider_value_changed)

func _on_music_slider_value_changed(value: float) -> void:
	# Update the global music slider value
	Global.music_slider_value = value
	
	# Update the music audio bus volume
	AudioServer.set_bus_volume_db(
		music_bus_index,
		linear_to_db(value)
	)

func _on_sfx_slider_value_changed(value: float) -> void:
	# Update the global sfx slider value
	Global.sfx_slider_value = value
	
	# Update the sound effects audio bus volume
	AudioServer.set_bus_volume_db(
		sfx_bus_index,
		linear_to_db(value)
	)

### Close the settings page
func _on_close_button_pressed() -> void:
	get_parent().get_node("TransitionLayer").visible = true
	await get_parent().get_node("TransitionLayer")._transition()
	# Clean up the node
	queue_free()

### Open the Github repository on a browser
func _on_github_button_pressed() -> void:
	OS.shell_open("https://github.com/algosup/2024-2025-project-2-serious-game-team-8")

func _on_tree_exiting() -> void:
	await get_parent().get_node("TransitionLayer")._fade_in()
