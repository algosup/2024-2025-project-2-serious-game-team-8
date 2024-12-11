extends LineEdit

var last_valid_text: String = ""  # To store the last valid text

var color_codes = {11: "#77EBED", 13: "#135BB5", 14: "C44B78", 15: "#F8EB44", 16: "#631C60", 18: "#C0810C", 19: "#032B5C", 21: "#81CB3B"}


func _ready() -> void:
	grab_focus()
	set_caret_column(len(text))
	# Remove the focus outline
	var focus_style = StyleBoxFlat.new()
	focus_style.bg_color = Color(0, 0, 0, 0)  # Fully transparent background
	focus_style.border_width_left = 0  # No left border
	focus_style.border_width_right = 0  # No right border
	focus_style.border_width_top = 0  # No top border
	focus_style.border_width_bottom = 0  # No bottom border
	add_theme_stylebox_override("focus", focus_style)

	# Remove the caret
	add_theme_color_override("caret_color", Color(0, 0, 0))  # Black caret

	# Remove the selection highlight
	add_theme_color_override("selection_color", Color(1, 1, 1, 1))  # Fully transparent selection
	# Connect the text_changed signal to validate input
	connect("text_changed", Callable(self, "_on_text_changed").bind(name))


func _change_slider_color(code: int, emitter: String) -> void:
	var rect = $"../../../TestTubeControl/Slider1"
	match emitter:
		"Input":
			rect = $"../../../TestTubeControl/Slider1"
		"Input2":
			rect = $"../../../TestTubeControl/Slider2"
		"Input3":
			rect = $"../../../TestTubeControl/Slider3"
	if code in color_codes:
		var color = Color(color_codes[code])
		rect.color = color
		$"../../FillButton".disabled=true
		$"../../FillButton2".disabled=true
		$"../../FillButton3".disabled=true
		$"../../ResetButton".disabled=true
		# Set the liquid to the first line of the test tube
		var new_height = rect.size.y + 87
		var new_Y = -87
		var tween = rect.create_tween()
		# Calculate new position and size
		var new_position = rect.position + Vector2(0, new_Y)  # Move up by the increase amount
		var new_size = Vector2(rect.size.x, new_height)  # Update only the height

		# Animate position and size
		tween.tween_property(rect, "position", new_position, 1.0)  # Duration: 1 second
		tween.parallel().tween_property(rect, "size", new_size, 1.0)
		await tween.finished
		$"../../FillButton".disabled=false
		$"../../FillButton2".disabled=false
		$"../../FillButton3".disabled=false
		$"../../ResetButton".disabled=false


func _on_text_changed(new_text: String, emitter_name: String) -> void:
	await $"../../../..".reset_one_liquid(emitter_name)
	_change_slider_color(int(new_text), emitter_name)
	# Regex to allow only positive integers
	var regex = RegEx.new()
	regex.compile(r"^\d*$")  # Match only digits (0-9)
	# Check if the new text is valid
	if regex.search(new_text):
		last_valid_text = new_text  # Update the last valid text
	else:
		text = last_valid_text  # Revert to the last valid text
		set_caret_column(len(last_valid_text))  # Restore caret position
