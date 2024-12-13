extends Node2D

## This script manages the second enigma, also known as the chemical mixer.
## It handles visual and audio feedback, multiple combinations, and interactions with physical cards.

# Track the number of fills for each slider
var fill_counts = {"Slider1": 0, "Slider2": 0, "Slider3": 0}

# Audio player for the water pouring sound effect
var water_sound_player: AudioStreamPlayer

# A 3D array representing combinations of ingredients.
# Each sub-array contains a card's ID and its quantity.
# Even indices represent ecological combinations; odd indices represent harmful combinations.
const combinations = [
	[[13, 4], [14, 1], [16, 2]],
	[[19, 1], [18, 3], [22, 2]],
	[[14, 4], [18, 2], [16, 3]],
	[[14, 2], [18, 4], [21, 1]],
	[[18, 1], [22, 4], [13, 2]],
	[[21, 4], [19, 2], [22, 3]]
]

# Dictionary of color codes for each liquid, mapping IDs to hex color strings
var color_codes = {13: "#135BB5", 14: "C44B78", 15: "#F8EB44", 16: "#631C60", 18: "#C0810C", 19: "#032B5C", 21: "#81CB3B", 22: "#77EBED"}

# The maximum number of fills a test tube can hold
const MAX_FILLS = 4

# The amount by which a slider's size increases per fill
const INCREASE_AMOUNT = 76


func _ready() -> void:
	# Initialize the audio player and load the water sound effect
	water_sound_player = $SFX
	water_sound_player.stream = load("res://resources/musics/sound_effects/water.mp3")  # Ensure the path is correct

	# Set the visibility and color of the cards' point lights based on global state
	$CanvasLayer/Control/CardNumber/PointLight2D.visible = Global.is_enigma_two_card_one_visible
	$CanvasLayer/Control/CardNumber2/PointLight2D2.visible = Global.is_enigma_two_card_two_visible
	$CanvasLayer/Control/CardNumber3/PointLight2D3.visible = Global.is_enigma_two_card_three_visible

	$CanvasLayer/Control/CardNumber.self_modulate = Color(1, 1, 1) if Global.is_enigma_two_card_one_visible else Color(0, 0, 0)
	$CanvasLayer/Control/CardNumber2.self_modulate = Color(1, 1, 1) if Global.is_enigma_two_card_two_visible else Color(0, 0, 0)
	$CanvasLayer/Control/CardNumber3.self_modulate = Color(1, 1, 1) if Global.is_enigma_two_card_three_visible else Color(0, 0, 0)

	# Synchronize the timer's appearance with the parent's timer
	$CanvasLayer/TimerControl/TimerBg/TimerText.modulate = get_parent().get_child(0).get_node("TimerControl").get_node("TimerBg").get_node("TimerText").modulate


# Close the enigma scene when the return button is pressed
func _on_return_button_pressed() -> void:
	queue_free()


# Increase the size of a specified slider to simulate filling a test tube
func _increase_rect_size(rectangle: ColorRect, slider_name: String) -> void:
	# Calculate new height and clamp it to the maximum allowed height
	var new_height = rectangle.size.y + INCREASE_AMOUNT
	var new_Y = -INCREASE_AMOUNT

	# Check if the fill count is below the maximum
	if fill_counts[slider_name] < MAX_FILLS:
		water_sound_player.play()  # Play the water sound effect

		# Increment the fill count
		fill_counts[slider_name] += 1
		var tween = rectangle.create_tween()

		# Calculate new position and size for the slider
		var new_position = rectangle.position + Vector2(0, new_Y)
		var new_size = Vector2(rectangle.size.x, new_height)

		# Animate the position and size of the slider
		tween.tween_property(rectangle, "position", new_position, 1.0)
		tween.parallel().tween_property(rectangle, "size", new_size, 1.0)
		await tween.finished


# Reset all sliders and liquids to their initial state
func _on_reset_button_pressed() -> void:
	reset_all_liquids()


# Reset a single slider and its associated controls
func reset_one_liquid(emitter: String) -> void:
	# Enable the reset button
	$"CanvasLayer/ButtonsControl/ResetButton".disabled = false

	# Identify the slider and reset button based on the emitter name
	var slider = $"CanvasLayer/TestTubeControl/Slider1"
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

	# Animate resetting the slider size and position
	var tween = slider.create_tween()
	var new_position = slider.position + Vector2(0, slider.size.y)
	var new_size = Vector2(slider.size.x, 0)
	tween.tween_property(slider, "position", new_position, 1.0)
	tween.parallel().tween_property(slider, "size", new_size, 1.0)

	# Reset the fill count
	fill_counts[fill_count_index] = 0

	# Reset buttons and input fields
	$"CanvasLayer/ButtonsControl/FillButton".disabled = true
	$"CanvasLayer/ButtonsControl/FillButton2".disabled = true
	$"CanvasLayer/ButtonsControl/FillButton3".disabled = true
	$"CanvasLayer/ButtonsControl/ResetButton".disabled = true
	$CanvasLayer/ButtonsControl/TextureRect/Input.editable = true
	$CanvasLayer/ButtonsControl/TextureRect2/Input2.editable = true
	$CanvasLayer/ButtonsControl/TextureRect3/Input3.editable = true
	await tween.finished


# Reset all sliders and fill counts to their initial state
func reset_all_liquids() -> void:
	water_sound_player.play()
	for child in $CanvasLayer/TestTubeControl.get_children():
		if child is ColorRect:
			var tween = child.create_tween()
			var new_position = child.position + Vector2(0, child.size.y)
			var new_size = Vector2(child.size.x, 0)
			tween.tween_property(child, "position", new_position, 1.0)
			tween.parallel().tween_property(child, "size", new_size, 1.0)

	# Clear input fields
	$CanvasLayer/ButtonsControl/TextureRect/Input.text = ""
	$CanvasLayer/ButtonsControl/TextureRect2/Input2.text = ""
	$CanvasLayer/ButtonsControl/TextureRect3/Input3.text = ""

	# Reset all fill counts
	for key in fill_counts.keys():
		fill_counts[key] = 0

# Handles the event when the first fill button is pressed
func _on_fill_button_1_pressed() -> void:
	# Check if the input is a valid color code
	if int($CanvasLayer/ButtonsControl/TextureRect/Input.text) in color_codes:
		# Temporarily disable the fill and reset buttons to prevent multiple actions
		$CanvasLayer/ButtonsControl/FillButton.disabled = true
		$CanvasLayer/ButtonsControl/ResetButton.disabled = true
		# Increase the slider size (simulate filling the tube) and wait for the animation to finish
		await _increase_rect_size($CanvasLayer/TestTubeControl/Slider1, "Slider1")
		# Re-enable the fill and reset buttons after the action is complete
		$CanvasLayer/ButtonsControl/FillButton.disabled = false
		$CanvasLayer/ButtonsControl/ResetButton.disabled = false

# Handles the event when the second fill button is pressed
func _on_fill_button_2_pressed() -> void:
	# Check if the input is a valid color code
	if int($CanvasLayer/ButtonsControl/TextureRect2/Input2.text) in color_codes:
		# Temporarily disable the fill and reset buttons to prevent multiple actions
		$CanvasLayer/ButtonsControl/FillButton2.disabled = true
		$CanvasLayer/ButtonsControl/ResetButton.disabled = true
		# Increase the slider size and wait for the animation to finish
		await _increase_rect_size($CanvasLayer/TestTubeControl/Slider2, "Slider2")
		# Re-enable the fill and reset buttons after the action is complete
		$CanvasLayer/ButtonsControl/FillButton2.disabled = false
		$CanvasLayer/ButtonsControl/ResetButton.disabled = false

# Handles the event when the third fill button is pressed
func _on_fill_button_3_pressed() -> void:
	# Check if the input is a valid color code
	if int($CanvasLayer/ButtonsControl/TextureRect3/Input3.text) in color_codes:
		# Temporarily disable the fill and reset buttons to prevent multiple actions
		$CanvasLayer/ButtonsControl/FillButton3.disabled = true
		$CanvasLayer/ButtonsControl/ResetButton.disabled = true
		# Increase the slider size and wait for the animation to finish
		await _increase_rect_size($CanvasLayer/TestTubeControl/Slider3, "Slider3")
		# Re-enable the fill and reset buttons after the action is complete
		$CanvasLayer/ButtonsControl/FillButton3.disabled = false
		$CanvasLayer/ButtonsControl/ResetButton.disabled = false

# Checks if a given pair of ingredient ID and quantity exists in the predefined combinations
func _contains_pair(pair: Array):
	# Iterate through each combination
	for i in range(combinations.size()):
		for sub_pair in combinations[i]:
			# Return the index if the pair matches any sub-pair
			if sub_pair == pair:
				return i
	# Return false if the pair is not found in any combination
	return false

# Handles the event when the analyse button is pressed
func _on_analyse_button_pressed() -> void:
	# Gather inputs as pairs of ingredient IDs and their fill counts
	var input1 = [int($CanvasLayer/ButtonsControl/TextureRect/Input.text), fill_counts["Slider1"]]
	var input2 = [int($CanvasLayer/ButtonsControl/TextureRect2/Input2.text), fill_counts["Slider2"]]
	var input3 = [int($CanvasLayer/ButtonsControl/TextureRect3/Input3.text), fill_counts["Slider3"]]

	# Ensure all three inputs are unique
	if input1 != input2 and input1 != input3 and input2 != input3:
		# Check if each input exists in the combinations
		var input1_result = _contains_pair(input1)
		var input2_result = _contains_pair(input2)
		var input3_result = _contains_pair(input3)

		# If any result is false, the combination doesn't exist
		if typeof(input1_result) == TYPE_BOOL or typeof(input2_result) == TYPE_BOOL or typeof(input3_result) == TYPE_BOOL:
			popup("This combination does not exist. \nYou lose one minute.")
		# If all results match, display the appropriate feedback
		elif input1_result == input2_result and input1_result == input3_result:
			match input1_result:
				0:
					popup("This solution is interesting! All these ingredients are completely biodegradable. This liquid can clean most surfaces, even greasy ones thanks to black soap. Vinegar helps to dissolve stains and works as an anti-bacterial. Mixed with baking soda, it produces some acetate, a perfect metal cleaner!")
					if not Global.is_enigma_two_card_one_visible:
						Global.is_enigma_two_card_one_visible = true
						$CanvasLayer/Control/CardNumber/PointLight2D.visible = true
						$CanvasLayer/Control/CardNumber.self_modulate = Color(1, 1, 1)
				1:
					popup("Your product seems to clean most surfaces properly. However, benzalkonium chloride is harmful to aquatic life, while sodium laureth sulfate, which is found in many soaps, is not only harmful to the skin but also poorly biodegradable.")
				2:
					popup("That's what I wanted! You made a gentle but efficient abrasive thanks to baking soda and citric acid. Black soap makes this a safe and sustainable cleaning agent... and nothing bad for the planet!")
					if not Global.is_enigma_two_card_two_visible:
						Global.is_enigma_two_card_two_visible = true
						$CanvasLayer/Control/CardNumber2/PointLight2D2.visible = true
						$CanvasLayer/Control/CardNumber2.self_modulate = Color(1, 1, 1)
				3:
					popup("This solution could be a good scouring agent... Nevertheless, overused in most shampoos, sodium laureth sulfate is a skin, respiratory, and mucous membrane irritant, while less harmful phosphates stimulate the growth of algae and bacteria in the water. Fortunately, these are avoidable...")
				4:
					popup("Amazing! This liquid seems to daintily soften water which contains a lot of limestone. Vinegar and citric acid are not only nice for the environment but effective at softening and descaling. It could be used for a dishwasher or washing machine, and even for boilers or jugs...")
					if not Global.is_enigma_two_card_three_visible:
						Global.is_enigma_two_card_three_visible = true
						$CanvasLayer/Control/CardNumber3/PointLight2D3.visible = true
						$CanvasLayer/Control/CardNumber3.self_modulate = Color(1, 1, 1)
				5:
					popup("Even if this mix seems to reduce limestone in water, I wouldn't use it in my house... Phosphates only stimulate the growth of algae and bacteria in the water, but benzalkonium is very toxic to aquatic organisms and poorly biodegradable...")
		else:
			popup("This combination does not exist. \nYou lose one minute.")
	else:
		popup("This combination does not exist. \nYou lose one minute.")

# Displays a popup message with the given text
func popup(text):
	# Create a popup instance from the global popup resource
	var popup_page = Global.pop_up_enigma_two.instantiate()
	# Set the text and color for the popup
	popup_page.text = text
	popup_page.color = Color(0, 0, 0)
	# Add the popup to the scene
	add_child(popup_page)
