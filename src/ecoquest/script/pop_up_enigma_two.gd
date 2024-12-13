extends Node2D

## This script manages the popups that appear on the second enigma

# Exported variables to allow easy customization in the editor
@export var text: String = ""  # The text that will be displayed in the label
@export var color: Color = Color(1, 1, 1)  # The color of the text

# Called when the node is added to the scene and ready
func _ready() -> void:
	# Set the label's text to the value of the `text` variable
	$CanvasLayer/ColorRect/Label.text = text
	
	# Override the default font color with the specified `color`
	$CanvasLayer/ColorRect/Label.add_theme_color_override("font_color", color)

# Handle input events (such as mouse clicks)
func _input(event):
	# Check if the input event is a mouse button press
	if event is InputEventMouseButton:
		if event.is_pressed():
			# Remove this node from the scene when the mouse button is pressed
			queue_free()
