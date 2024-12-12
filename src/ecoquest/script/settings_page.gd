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
	if not $"CanvasLayer/MusicSliderControl/Music Slider".is_connected("value_changed", Callable(self, "_on_music_slider_value_changed")):
			$"CanvasLayer/MusicSliderControl/Music Slider".value_changed.connect(_on_music_slider_value_changed)

func _on_music_slider_value_changed(value: float) -> void:
	# Update the global value
	Global.music_slider_value = value
	
	# Update the audio bus volume
	AudioServer.set_bus_volume_db(
		bus_index,
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


func _on_sfx_slider_value_changed(value: float) -> void:
	Global.sfx_slider_value = value
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value)
	)
