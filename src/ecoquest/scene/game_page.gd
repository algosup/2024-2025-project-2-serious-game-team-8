extends Node2D

### Close the settings page
func _on_close_button_pressed() -> void:
	# Clean up the node
	queue_free()

var visibilityOn= load("res://resources/svg/visibility.png")
var visibilityOff= load("res://resources/svg/no-visibility.png")
### Change the visibility icon's texture and toggle the visibility of the game controls on/off
func _on_visibility_pressed() -> void:
	if($CanvasLayer/GameControls.visible):
		$CanvasLayer/VisibilityControl/Visibility.texture_normal=visibilityOff
		$CanvasLayer/GameControls.visible=false
	else:
		$CanvasLayer/VisibilityControl/Visibility.texture_normal=visibilityOn
		$CanvasLayer/GameControls.visible=true
		
	
