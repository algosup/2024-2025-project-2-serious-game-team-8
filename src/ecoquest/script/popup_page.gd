extends Node2D

## This script manages the popup that appears in most pages


# Exported variables for easy customization in the editor
@export var text: String = ""        # The text to display on the label
@export var color: Color = Color(1, 1, 1)  # The color of the label's text (default is white)

# Called when the node is added to the scene and ready
func _ready() -> void:
	# Set the label's text to the value of the `text` variable
	$CanvasLayer/ColorRect/Label.text = text
	
	# Override the label's font color with the specified `color`
	$CanvasLayer/ColorRect/Label.add_theme_color_override("font_color", color)

# Detects input events
func _input(event):
	# Check if the event is a mouse button click
	if event is InputEventMouseButton:
		# Check if the mouse button was pressed (not released)
		if event.is_pressed():
			# Remove this node from the scene (useful for closing popups or temporary elements)
			queue_free()
