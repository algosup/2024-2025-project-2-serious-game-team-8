extends Node2D

# Track fills for each slider
var fill_counts = {"Slider1": 0, "Slider2": 0, "Slider3": 0}

# A 3 dimensional array representing:
# a combination of 3 ingredients
# where each ingredient is a card's ID and it's quantity.
# Every pair index are ecological combinations, impair index are harmful combinations
const combinations = [
	[[13, 4], [14, 1], [16, 2]],
	[[19, 1], [18, 2], [11, 4]],
	[[14, 3], [15, 1], [16, 2]],
	[[14, 3], [18, 2], [21, 2]],
	[[13, 2], [11, 4], [15, 1]],
	[[19, 1], [11, 3], [21, 1]]
]

const MAX_FILLS = 5
const INCREASE_AMOUNT = 76
const MAX_HEIGHT = 449


func _on_return_button_pressed() -> void:
	queue_free()


func _increase_rect_size(rectangle: ColorRect, slider_name: String) -> void:
	# Calculate new height and clamp it to the maximum
	var new_height = rectangle.size.y + INCREASE_AMOUNT
	var new_Y = -INCREASE_AMOUNT

	# Check if the slider has reached the fill limit
	if fill_counts[slider_name] == 0:
		new_height = rectangle.size.y + 87
		new_Y = -87
	# Increment the fill count
	fill_counts[slider_name] += 1

	# Check if the new height is lower than the maximum
	if new_height < MAX_HEIGHT:
		var tween = rectangle.create_tween()
		# Calculate new position and size
		var new_position = rectangle.position + Vector2(0, new_Y)  # Move up by the increase amount
		var new_size = Vector2(rectangle.size.x, new_height)  # Update only the height

		# Animate position and size
		tween.tween_property(rectangle, "position", new_position, 1.0)  # Duration: 1 second
		tween.parallel().tween_property(rectangle, "size", new_size, 1.0)
		await tween.finished


func _on_reset_button_pressed() -> void:
	reset_liquids()

func reset_liquids()-> void:
	# Reset all sliders and fill counts
	for child in $CanvasLayer/TestTubeControl.get_children():
		if child is ColorRect:
			var tween = child.create_tween()

			var new_position = child.position + Vector2(0, child.size.y)  # Adjust position to move down by current height
			var new_size = Vector2(child.size.x, 0)  # Reset height to 0, keep the width unchanged
			tween.tween_property(child, "position", new_position, 1.0)  # Duration: 1 second
			tween.parallel().tween_property(child, "size", new_size, 1.0)

	# Reset fill counts
	for key in fill_counts.keys():
		fill_counts[key] = 0
		
func _on_fill_button_pressed(slider_name: String, slider_node: ColorRect) -> void:
	# Use the generic function to increase size
	_increase_rect_size(slider_node, slider_name)


func _on_fill_button_1_pressed() -> void:
	$CanvasLayer/ButtonsControl/FillButton.disabled = true
	$CanvasLayer/ButtonsControl/TextureRect/Input.text
	await _increase_rect_size($CanvasLayer/TestTubeControl/Slider1, "Slider1")
	$CanvasLayer/ButtonsControl/FillButton.disabled = false


func _on_fill_button_2_pressed() -> void:
	$CanvasLayer/ButtonsControl/FillButton2.disabled = true
	await _increase_rect_size($CanvasLayer/TestTubeControl/Slider2, "Slider2")
	$CanvasLayer/ButtonsControl/FillButton2.disabled = false


func _on_fill_button_3_pressed() -> void:
	$CanvasLayer/ButtonsControl/FillButton3.disabled = true
	await _increase_rect_size($CanvasLayer/TestTubeControl/Slider3, "Slider3")
	$CanvasLayer/ButtonsControl/FillButton3.disabled = false


func _contains_pair(pair: Array):
	for i in range(combinations.size()):
		for sub_pair in combinations[i]:
			if sub_pair == pair:
				return i
	return false

func _on_analyse_button_pressed() -> void:

	var input1 = [int($CanvasLayer/ButtonsControl/TextureRect/Input.text), fill_counts["Slider1"]]
	var input2 = [int($CanvasLayer/ButtonsControl/TextureRect2/Input2.text), fill_counts["Slider2"]]
	var input3 = [int($CanvasLayer/ButtonsControl/TextureRect3/Input3.text), fill_counts["Slider3"]]
	if (input1 != input2 and input1 != input3 and input2 != input3):
		var input1_result = _contains_pair(input1)
		var input2_result = _contains_pair(input2)
		var input3_result = _contains_pair(input3)
		
		if typeof(input1_result) == TYPE_BOOL or typeof(input2_result) == TYPE_BOOL or typeof(input3_result) == TYPE_BOOL:
			print("false")
		elif(input1_result == input2_result and input1_result == input3_result):
			print("true")
	else:
		print("false")
