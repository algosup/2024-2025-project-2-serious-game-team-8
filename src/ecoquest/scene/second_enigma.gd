extends Node2D

# Track fills for each slider
var fill_counts = {
	"Slider1": 0,
	"Slider2": 0,
	"Slider3": 0
}

const MAX_FILLS = 5
const INCREASE_AMOUNT = 76
const MAX_HEIGHT = 449

func _ready() -> void:
	pass

func _on_return_button_pressed() -> void:
	queue_free()

func _increase_rect_size(rectangle: ColorRect, slider_name: String) -> void:
	# Calculate new height and clamp it to the maximum
	var new_height = rectangle.size.y + INCREASE_AMOUNT
	var new_Y= -INCREASE_AMOUNT 
	
	# Check if the slider has reached the fill limit
	if fill_counts[slider_name] == 0:
		new_height = rectangle.size.y + 87
		new_Y= -87
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
	$CanvasLayer/ButtonsControl/FillButton.disabled=true
	await _increase_rect_size($CanvasLayer/TestTubeControl/Slider1,"Slider1")
	$CanvasLayer/ButtonsControl/FillButton.disabled=false
	
func _on_fill_button_2_pressed() -> void:
	$CanvasLayer/ButtonsControl/FillButton2.disabled=true
	await _increase_rect_size($CanvasLayer/TestTubeControl/Slider2,"Slider2")
	$CanvasLayer/ButtonsControl/FillButton2.disabled=false
	
func _on_fill_button_3_pressed() -> void:
	$CanvasLayer/ButtonsControl/FillButton3.disabled=true
	await _increase_rect_size($CanvasLayer/TestTubeControl/Slider3, "Slider3")
	$CanvasLayer/ButtonsControl/FillButton3.disabled=false
