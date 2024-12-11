extends LineEdit

var last_valid_text: String = ""  # To store the last valid text

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
	connect("text_changed", Callable(self, "_on_text_changed"))

func _on_text_changed(new_text: String) -> void:
	$"../../../..".reset_liquids()
	
	# Regex to allow only positive integers
	var regex = RegEx.new()
	regex.compile(r"^\d*$")  # Match only digits (0-9)
	
	# Check if the new text is valid
	if regex.search(new_text):
		last_valid_text = new_text  # Update the last valid text
	else:
		text = last_valid_text  # Revert to the last valid text
		set_caret_column(len(last_valid_text))  # Restore caret position
