extends LineEdit

## This script manages the differents inputs the users can interact with in the second enigma.

# Store the last valid text entered by the user
var last_valid_text: String = ""  

func _ready() -> void:
	# Automatically focus on the LineEdit when the scene loads
	grab_focus()
	
	# Set the caret (cursor) position to the end of the existing text
	set_caret_column(len(text))
	
	# Remove the default focus outline by setting a fully transparent style box
	var focus_style = StyleBoxFlat.new()
	focus_style.bg_color = Color(1, 1, 1, 0.5)  # White with 50% transparency
	focus_style.border_width_left = 0
	focus_style.border_width_right = 0
	focus_style.border_width_top = 0
	focus_style.border_width_bottom = 0
	
	# Set the corner radius for the top-left corner of the focus style to 500 pixels, making it highly rounded.
	focus_style.corner_radius_top_left = 500
	# Set the corner radius for the top-right corner of the focus style to 500 pixels, ensuring it matches the top-left for symmetry.
	focus_style.corner_radius_top_right = 500
	# Set the corner radius for the bottom-left corner of the focus style to 500 pixels, rounding the bottom-left side.
	focus_style.corner_radius_bottom_left = 500
	# Set the corner radius for the bottom-right corner of the focus style to 500 pixels, making the bottom-right side match the other corners.
	focus_style.corner_radius_bottom_right = 500

	add_theme_stylebox_override("focus", focus_style)

	# Make the caret (cursor) invisible by setting it to a black color
	add_theme_color_override("caret_color", Color(0, 0, 0))

	# Make the text selection highlight fully transparent
	add_theme_color_override("selection_color", Color(1, 1, 1, 1))

	# Connect the `text_changed` signal to the `_on_text_changed` function
	# and pass the current node name as the emitter name
	connect("text_changed", Callable(self, "_on_text_changed").bind(name))


# Function to change the color of the corresponding slider based on a code
func _change_slider_color(code: int, emitter: String) -> void:
	# Default to the first slider
	var rect = $"../../../TestTubeControl/Slider1"
	
	# Determine which slider to update based on the emitter string
	match emitter:
		"Input":
			rect = $"../../../TestTubeControl/Slider1"
		"Input2":
			rect = $"../../../TestTubeControl/Slider2"
		"Input3":
			rect = $"../../../TestTubeControl/Slider3"

	# Check if the code exists in the color codes dictionary
	if code in $"../../../..".color_codes:
		# Retrieve the color associated with the code
		var color = Color($"../../../..".color_codes[code])
		rect.color = color  # Update the slider color
		
		# Disable all fill and reset buttons during the animation
		$"../../FillButton".disabled = true
		$"../../FillButton2".disabled = true
		$"../../FillButton3".disabled = true
		$"../../ResetButton".disabled = true

		# Increase the slider's height by 87 pixels and move it up by 87 pixels
		var new_height = rect.size.y + 87
		var new_Y = -87
		var tween = rect.create_tween()
		
		# Calculate new position and size for the animation
		var new_position = rect.position + Vector2(0, new_Y)
		var new_size = Vector2(rect.size.x, new_height)

		# Animate the position and size over 1 second
		tween.tween_property(rect, "position", new_position, 1.0)
		tween.parallel().tween_property(rect, "size", new_size, 1.0)
		
		await tween.finished  # Wait for the animation to complete

		# Re-enable the fill and reset buttons
		$"../../FillButton".disabled = false
		$"../../FillButton2".disabled = false
		$"../../FillButton3".disabled = false
		$"../../ResetButton".disabled = false


# Function to handle text changes in the LineEdit
func _on_text_changed(new_text: String, emitter_name: String) -> void:
	# Reset the corresponding slider before applying changes
	await $"../../../..".reset_one_liquid(emitter_name)
	
	# Change the slider color based on the new input
	_change_slider_color(int(new_text), emitter_name)

	# Create a regular expression to allow only positive integers
	var regex = RegEx.new()
	regex.compile(r"^\d*$")  # Match only digits (0-9)

	# Check if the new text matches the regex (i.e., is valid)
	if regex.search(new_text):
		last_valid_text = new_text  # Store the valid text
	else:
		text = last_valid_text  # Revert to the last valid text if input is invalid
		set_caret_column(len(last_valid_text))  # Restore the caret position to the end of valid text
