extends Node2D

## This script manages the settings page, it includes:
## - The management of the different sound buses
## - A link to the GitHub page

# Main music bus
var music_bus_index: int
# Sound effect bus
var sfx_bus_index: int

func _ready() -> void:
	# Get the audio bus indices for "Menu Music" and "SFX"
	music_bus_index = AudioServer.get_bus_index("Menu Music")
	sfx_bus_index = AudioServer.get_bus_index("SFX")  

	# Set the music bus' volume to the saved values
	AudioServer.set_bus_volume_db(
		music_bus_index,
		linear_to_db(Global.music_slider_value)
	)
	
	# Set the sound effects bus' volume to the saved value
	AudioServer.set_bus_volume_db(
		sfx_bus_index,
		linear_to_db(Global.sfx_slider_value)
	)

	# Initialize the sliders' values to the saved values
	$"CanvasLayer/MusicSliderControl/Music Slider".value = Global.music_slider_value
	$CanvasLayer/MusicSliderControl/SFXSlider.value = Global.sfx_slider_value

	# Connect the sliders value_changed signals
	if not $"CanvasLayer/MusicSliderControl/Music Slider".is_connected("value_changed", Callable(self, "_on_music_slider_value_changed")):
			$"CanvasLayer/MusicSliderControl/Music Slider".value_changed.connect(_on_music_slider_value_changed)
	
	if not $CanvasLayer/MusicSliderControl/SFXSlider.is_connected("value_changed", Callable(self, "_on_sfx_slider_value_changed")):
			$CanvasLayer/MusicSliderControl/SFXSlider.value_changed.connect(_on_sfx_slider_value_changed)

# Upon changing the values of the music slider,
# save the new values into a file named "Ekolock_save"
func _on_music_slider_value_changed(value: float) -> void:
	# Update the global music slider value
	Global.music_slider_value = value
	
	# Update the music audio bus volume
	AudioServer.set_bus_volume_db(
		music_bus_index,
		linear_to_db(value)
	)
	# Save the game
	Global.save_game()

# Upon changing the values of the SFX slider,
# save the new values into a file named "Ekolock_save"
func _on_sfx_slider_value_changed(value: float) -> void:
	# Update the global sfx slider value
	Global.sfx_slider_value = value
	
	# Update the sound effects audio bus volume
	AudioServer.set_bus_volume_db(
		sfx_bus_index,
		linear_to_db(value)
	)
	# Save the game
	Global.save_game()

# Close the settings page
func _on_close_button_pressed() -> void:
	get_parent().get_node("TransitionLayer").visible = true
	await get_parent().get_node("TransitionLayer")._transition()
	# Clean up the node
	queue_free()

# Open the Github repository on a browser
func _on_github_button_pressed() -> void:
	OS.shell_open("https://github.com/algosup/2024-2025-project-2-serious-game-team-8")

# Upon exiting the page, start the fade in animation on the parent page
func _on_tree_exiting() -> void:
	await get_parent().get_node("TransitionLayer")._fade_in()
