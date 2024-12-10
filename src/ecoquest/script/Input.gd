extends LineEdit

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
