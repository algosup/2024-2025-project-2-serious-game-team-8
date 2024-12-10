extends LineEdit

func _ready() -> void:
	grab_focus()
	set_caret_column(len(text))
	# Override the caret color to black
	add_theme_color_override("caret_color", Color.BLACK)
