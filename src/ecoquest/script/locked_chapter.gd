extends Node2D

# Handles input events such as mouse clicks
func _input(event):
	# Check if the event is a mouse button event
	if event is InputEventMouseButton:
		# Check if the mouse button was pressed (not released)
		if event.is_pressed():
			# Remove the node from the scene (e.g., dismiss the popup or element)
			queue_free()
