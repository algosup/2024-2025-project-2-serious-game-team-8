extends Node2D

var is_paused: bool = false
func _ready() -> void:
	$CanvasLayer/Timer.start()
func _process(delta: float) -> void:
	var minutes = int($CanvasLayer/Timer.time_left / 60) # Get the minutes 
	var seconds = int(fmod($CanvasLayer/Timer.time_left,  60)) # Get the seconds 
	$CanvasLayer/TimerControl/TimerBg/TimerText.text = str(minutes)+':'+str(seconds)


### Close the settings page
func _on_close_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/home_page.tscn")

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
		
	

func _on_pause_pressed() -> void:
	if is_paused == false: 
		is_paused = true
		$CanvasLayer/GameControls/PauseAnimation.play("pause")
		$CanvasLayer/Timer.paused=true

	else:  
		is_paused = false
		$CanvasLayer/Timer.paused=false
		$CanvasLayer/GameControls/PauseAnimation.play("RESET")
