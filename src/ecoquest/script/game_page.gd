extends Node2D

var is_paused: bool = false
var initial_time: float = 900.0  # Initial time in seconds (15 minutes)

func _ready() -> void:
	$CanvasLayer/Timer.wait_time = initial_time  # Set the timer's countdown time
	$CanvasLayer/Timer.start()
	
func _process(delta: float) -> void:
	var minutes = int($CanvasLayer/Timer.time_left / 60)  # Get the minutes
	var seconds = int(fmod($CanvasLayer/Timer.time_left, 60))  # Get the seconds
	$CanvasLayer/TimerControl/TimerBg/TimerText.text = str(minutes)+':'+str(seconds)
	_removing_leaves()


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
		
func _removing_leaves() -> void:
	if $CanvasLayer/Timer.time_left < 720:
		$CanvasLayer/BackgroundControl/leaf5.visible = false
	if $CanvasLayer/Timer.time_left < 540:
		$CanvasLayer/BackgroundControl/leaf4.visible = false
	if $CanvasLayer/Timer.time_left < 360:
		$CanvasLayer/BackgroundControl/leaf3.visible = false
	if $CanvasLayer/Timer.time_left < 180:
		$CanvasLayer/BackgroundControl/leaf2.visible = false
	if $CanvasLayer/Timer.time_left <= 0:
		$CanvasLayer/BackgroundControl/leaf1.visible = false


func _on_code_pressed() -> void:
	add_child(Global.code_page.instantiate())


func _on_setting_button_pressed() -> void:
	add_child(Global.settings.instantiate())
