extends Node2D


func _ready() -> void:
	_increase_rect_size($CanvasLayer/TestTubeControl/Slider1, 235)
	_increase_rect_size($CanvasLayer/TestTubeControl/Slider2, 135)
	_increase_rect_size($CanvasLayer/TestTubeControl/Slider3, 435)


func _on_return_button_pressed() -> void:
		queue_free()

func _increase_rect_size(rectangle:ColorRect, newHeight:int) -> void:
	# If height is higher than 435, set it to 435
	if newHeight>435:
		newHeight=435
	var tween = rectangle.create_tween()

	# Starting values
	var original_position = rectangle.position
	var original_size = rectangle.size

	# Calculate the new position and size
	var new_position = original_position + Vector2(0, -newHeight)
	var new_size = original_size + Vector2(0, newHeight)
	
	# If the new size is bigger than the original one, change the size with an animation
	if new_size>original_size:
		# Tween the position and size properties simultaneously
		tween.tween_property(rectangle, "position", new_position, 1.0)  # Duration: 1 second
		tween.parallel().tween_property(rectangle, "size", new_size, 1.0)

	
