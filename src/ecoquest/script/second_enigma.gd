extends Node2D

## This script manages the second enigma, also known as the chemical mixer.
## It includes:
## - Visual and audio feedbacks,
## - Multiple ingredient combinations,
## - Redirections to 3 physical cards based on correct combinations.

# Dictionary to track the number of fills for each slider
var fill_counts = {"Slider1": 0, "Slider2": 0, "Slider3": 0}

# Audio player to play water sound effects
var water_sound_player: AudioStreamPlayer

# A 3-dimensional array representing combinations of ingredients.
# Each combination contains card IDs and quantities.
# Even indices are ecological combinations, odd indices are harmful combinations.
const combinations = [
	[[13, 4], [14, 1], [16, 2]],
	[[19, 1], [18, 3], [22, 2]],
	[[14, 4], [18, 2], [16, 3]],
	[[14, 2], [18, 4], [21, 1]],
	[[18, 1], [22, 4], [13, 2]],
	[[21, 4], [19, 2], [22, 3]]
]

# Dictionary holding color codes for each liquid based on their card IDs
var color_codes = {
	13: "#135BB5",
	14: "C44B78",
	15: "#F8EB44",
	16: "#631C60",
	18: "#C0810C",
	19: "#032B5C",
	21: "#81CB3B",
	22: "#77EBED"
}

# Maximum fills a test tube can hold
const MAX_FILLS = 4
# The amount a slider's height will increase per fill
const INCREASE_AMOUNT = 76

# Called when the node enters the scene tree
func _ready() -> void:
	# Initialize the audio player with the water sound effect
	water_sound_player = $SFX
	water_sound_player.stream = load("res://resources/musics/sound_effects/water.mp3")  # Ensure the path is correct

	# Set the visibility of card lights based on global flags
	$CanvasLayer/Control/CardNumber/PointLight2D.visible = Global.is_enigma_two_card_one_visible
	$CanvasLayer/Control/CardNumber2/PointLight2D2.visible = Global.is_enigma_two_card_two_visible
	$CanvasLayer/Control/CardNumber3/PointLight2D3.visible = Global.is_enigma_two_card_three_visible

	# Adjust the color modulation of card numbers based on their visibility
	$CanvasLayer/Control/CardNumber.self_modulate = Color(1, 1, 1) if Global.is_enigma_two_card_one_visible else Color(0, 0, 0)
	$CanvasLayer/Control/CardNumber2.self_modulate = Color(1, 1, 1) if Global.is_enigma_two_card_two_visible else Color(0, 0, 0)
	$CanvasLayer/Control/CardNumber3.self_modulate = Color(1, 1, 1) if Global.is_enigma_two_card_three_visible else Color(0, 0, 0)

	# Synchronize the timer display with the parent's timer
	$CanvasLayer/TimerControl/TimerBg/TimerText.modulate = get_parent().get_child(0).get_node("TimerControl").get_node("TimerBg").get_node("TimerText").modulate

# Close the enigma scene when the return button is pressed
func _on_return_button_pressed() -> void:
	queue_free()

# Function to increase the size of a slider (test tube fill)
func _increase_rect_size(rectangle: ColorRect, slider_name: String) -> void:
	# Calculate the new height and position for the slider
	var new_height = rectangle.size.y + INCREASE_AMOUNT
	var new_Y = -INCREASE_AMOUNT

	# Check if the fill count is below the maximum allowed
	if fill_counts[slider_name] < MAX_FILLS:
		water_sound_player.play()  # Play water sound effect
		
		# Increment the fill count for the specified slider
		fill_counts[slider_name] += 1
		var tween = rectangle.create_tween()
		# Animate the position and size changes
		var new_position = rectangle.position + Vector2(0, new_Y)
		var new_size = Vector2(rectangle.size.x, new_height)
		tween.tween_property(rectangle, "position", new_position, 1.0)
		tween.parallel().tween_property(rectangle, "size", new_size, 1.0)
		await tween.finished

# Reset all test tubes when the reset button is pressed
func _on_reset_button_pressed() -> void:
	reset_all_liquids()

# Reset one specific test tube and its related UI components
func reset_one_liquid(emitter: String) -> void:
	# Re-enable the reset button
	$"CanvasLayer/ButtonsControl/ResetButton".disabled = false

	# Identify the slider and buttons based on the emitter
	var slider
	var fill_count_index = 0
	match emitter:
		"Input":
			slider = $"CanvasLayer/TestTubeControl/Slider1"
			fill_count_index = 0
			$"CanvasLayer/ButtonsControl/FillButton".disabled = false
			$CanvasLayer/ButtonsControl/TextureRect/Input.editable = false
		"Input2":
			slider = $"CanvasLayer/TestTubeControl/Slider2"
			fill_count_index = 1
			$"CanvasLayer/ButtonsControl/FillButton2".disabled = false
			$CanvasLayer/ButtonsControl/TextureRect2/Input2.editable = false
		"Input3":
			slider = $"CanvasLayer/TestTubeControl/Slider3"
			fill_count_index = 2
			$"CanvasLayer/ButtonsControl/FillButton3".disabled = false
			$CanvasLayer/ButtonsControl/TextureRect3/Input3.editable = false

	# Reset the slider's size and position using a tween animation
	var tween = slider.create_tween()
	var new_position = slider.position + Vector2(0, slider.size.y)
	var new_size = Vector2(slider.size.x, 0)
	tween.tween_property(slider, "position", new_position, 1.0)
	tween.parallel().tween_property(slider, "size", new_size, 1.0)

	# Reset the fill count
	fill_counts[fill_count_index] = 0

	# Re-enable fill and reset buttons
	$"CanvasLayer/ButtonsControl/FillButton".disabled = true
	$"CanvasLayer/ButtonsControl/FillButton2".disabled = true
	$"CanvasLayer/ButtonsControl/FillButton3".disabled = true
	$"CanvasLayer/ButtonsControl/ResetButton".disabled = true

	# Allow text input again
	$CanvasLayer/ButtonsControl/TextureRect/Input.editable = true
	$CanvasLayer/ButtonsControl/TextureRect2/Input2.editable = true
	$CanvasLayer/ButtonsControl/TextureRect3/Input3.editable = true
	await tween.finished

# Reset all sliders and inputs
func reset_all_liquids() -> void:
	water_sound_player.play()
	# Loop through each slider and reset position and size
	for child in $CanvasLayer/TestTubeControl.get_children():
		if child is ColorRect:
			var tween = child.create_tween()
			var new_position = child.position + Vector2(0, child.size.y)
			var new_size = Vector2(child.size.x, 0)
			tween.tween_property(child, "position", new_position, 1.0)
			tween.parallel().tween_property(child, "size", new_size, 1.0)

	# Clear text inputs
	$CanvasLayer/ButtonsControl/TextureRect/Input.text = ""
	$CanvasLayer/ButtonsControl/TextureRect2/Input2.text = ""
	$CanvasLayer/ButtonsControl/TextureRect3/Input3.text = ""

	# Reset fill counts
	for key in fill_counts.keys():
		fill_counts[key] = 0

# Function to display a popup message
func popup(text):
	var popup_page = Global.pop_up_enigma_two.instantiate()
	popup_page.text = text
	popup_page.color = Color(0, 0, 0)
	add_child(popup_page)
