extends Node2D

var is_paused: bool = false

var minutes: int
var seconds: int


func _ready() -> void:
	minutes = 0
	seconds = 0


func _process(_delta: float) -> void:
	if $CanvasLayer/Timer.is_stopped() == false && $CanvasLayer/Timer.time_left >= 1:
		minutes = int($CanvasLayer/Timer.time_left / 60)  # Get the minutes
		seconds = int(fmod($CanvasLayer/Timer.time_left, 60))  # Get the seconds
		_removing_leaves()
		time_low_warning()
		if(has_node("CodePage")):
			$CodePage/CanvasLayer/TimerControl/TimerBg/TimerText.text = "%02d:%02d" % [minutes, seconds]
		else:
			$CanvasLayer/TimerControl/TimerBg/TimerText.text = "%02d:%02d" % [minutes, seconds]
			
	else:
		if $CanvasLayer/IncrementTimer.is_stopped():
			$CanvasLayer/IncrementTimer.start()
		if(has_node("CodePage")):
			$CodePage/CanvasLayer/TimerControl/TimerBg/TimerText.text = "+%02d:%02d" % [minutes, seconds]
		else:
			$CanvasLayer/TimerControl/TimerBg/TimerText.text = "+%02d:%02d" % [minutes, seconds]


### Close the settings page
func _on_close_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/home_page.tscn")


var visibilityOn = load("res://resources/svg/visibility.png")
var visibilityOff = load("res://resources/svg/no-visibility.png")


### Change the visibility icon's texture and toggle the visibility of the game controls on/off
func _on_visibility_pressed() -> void:
	if $CanvasLayer/GameControls.visible:
		$CanvasLayer/VisibilityControl/Visibility.texture_normal = visibilityOff
		$CanvasLayer/GameControls.visible = false
	else:
		$CanvasLayer/VisibilityControl/Visibility.texture_normal = visibilityOn
		$CanvasLayer/GameControls.visible = true


func _on_pause_pressed() -> void:
	if is_paused == false:
		is_paused = true
		$CanvasLayer/GameControls/PauseAnimation.play("pause")
		$CanvasLayer/Timer.paused = true

	else:
		is_paused = false
		$CanvasLayer/Timer.paused = false
		$CanvasLayer/GameControls/PauseAnimation.play("RESET")


func _removing_leaves() -> void:
	if $CanvasLayer/Timer.time_left < 720 && $CanvasLayer/BackgroundControl/LeafFiveControl/leaf5.visible:
		$CanvasLayer/BackgroundControl/LeafFiveControl/leaf5.visible = false
	if $CanvasLayer/Timer.time_left < 540 && $CanvasLayer/BackgroundControl/LeafFourControl/leaf4.visible:
		$CanvasLayer/BackgroundControl/LeafFourControl/leaf4.visible = false
	if $CanvasLayer/Timer.time_left < 360 && $CanvasLayer/BackgroundControl/LeafThreeControl/leaf3.visible:
		$CanvasLayer/BackgroundControl/LeafThreeControl/leaf3.visible = false
	if $CanvasLayer/Timer.time_left < 180 && $CanvasLayer/BackgroundControl/LeafTwoControl/leaf2.visible:
		$CanvasLayer/BackgroundControl/LeafTwoControl/leaf2.visible = false
	if $CanvasLayer/Timer.time_left <= 1 && $CanvasLayer/BackgroundControl/LeafOneControl/leaf1.visible:
		$CanvasLayer/BackgroundControl/LeafOneControl/leaf1.visible = false


func time_low_warning() -> void:
	if $CanvasLayer/Timer.time_left <= 120:
		$CanvasLayer/TimerControl/TimerBg/TimerText.modulate = Color(1, 0, 0)  # Set text to red


func _on_code_pressed() -> void:
	add_child(Global.code_page.instantiate())


func _on_setting_button_pressed() -> void:
	add_child(Global.settings.instantiate())


func _on_timer_timeout() -> void:
	$CanvasLayer/BackgroundControl/TextureRect.texture = load("res://resources/background/looseScreen2.png")


func _on_increment_timer_timeout() -> void:
	seconds+=1
	if(seconds == 60):
		seconds=0
		minutes+=1
		
