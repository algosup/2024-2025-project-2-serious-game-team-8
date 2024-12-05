extends Node2D

var is_paused: bool = false

var music_list = [
	"res://resources/musics/The Final Escape.mp3",
	"res://resources/musics/Climate Crisis in the Company.mp3",
	"res://resources/musics/The Final Flee.mp3"
]

var current_music_index: int = 0
@onready var music_player: AudioStreamPlayer = $BackgroundMusic


### This variable represents the minutes of the timer
@export var minutes: int

### This variable represents the seconds of the timer
@export var seconds: int

### This variable checks if the chapter is finished, it resets when the chapter is selected
@export var is_chapter_finished: bool = false

var time_limits = [600, 900, 1200]


func _ready() -> void:
	play_current_track()
	minutes = 0
	seconds = 0
	$CanvasLayer/Timer.start(time_limits[Global.current_chapter])


func _process(_delta: float) -> void:
	if is_chapter_finished:
		if $CanvasLayer/Timer.is_stopped() == false:
			minutes = int($CanvasLayer/Timer.time_left / 60)  # Get the minutes
			seconds = int(fmod($CanvasLayer/Timer.time_left, 60))  # Get the seconds
			$CanvasLayer/Timer.stop()
		else:
			$CanvasLayer/IncrementTimer.stop()
	elif $CanvasLayer/Timer.is_stopped() == false && $CanvasLayer/Timer.time_left >= 1:
		minutes = int($CanvasLayer/Timer.time_left / 60)  # Get the minutes
		seconds = int(fmod($CanvasLayer/Timer.time_left, 60))  # Get the seconds
		_removing_leaves()
		time_low_warning()
		if has_node("CodePage"):
			$CodePage/CanvasLayer/TimerControl/TimerBg/TimerText.text = "%02d:%02d" % [minutes, seconds]
		else:
			$CanvasLayer/TimerControl/TimerBg/TimerText.text = "%02d:%02d" % [minutes, seconds]

	else:
		if $CanvasLayer/IncrementTimer.is_stopped():
			$CanvasLayer/IncrementTimer.start()
		if has_node("CodePage"):
			$CodePage/CanvasLayer/TimerControl/TimerBg/TimerText.text = "+%02d:%02d" % [minutes, seconds]
		else:
			$CanvasLayer/TimerControl/TimerBg/TimerText.text = "+%02d:%02d" % [minutes, seconds]


func play_current_track() -> void:
	var audio_stream: AudioStream = load(music_list[current_music_index]) as AudioStream
	if audio_stream:
		music_player.stream = audio_stream  # Assign the loaded stream
		music_player.play()
		# Check if the signal is already connected before connecting
		if not music_player.is_connected("finished", Callable(self, "_on_music_finished")):
			music_player.connect("finished", Callable(self, "_on_music_finished"))
	else:
		print("Error: Failed to load audio stream from path: ", music_list[current_music_index])


func _on_music_finished() -> void:
	# Increment the music index and loop back if necessary
	current_music_index = (current_music_index + 1) % music_list.size()
	play_current_track()


### Close the settings page
func _on_close_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/home_page.tscn")


var visibilityOn = load("res://resources/svg/Icon/visibility.png")
var visibilityOff = load("res://resources/svg/Icon/no-visibility.png")


### Change the visibility icon's texture and toggle the visibility of the game controls on/off
func _on_visibility_pressed() -> void:
	if $CanvasLayer/GameControls.visible:
		$CanvasLayer/VisibilityControl/Visibility.texture_normal = visibilityOff
		$CanvasLayer/GameControls.visible = false
	else:
		$CanvasLayer/VisibilityControl/Visibility.texture_normal = visibilityOn
		$CanvasLayer/GameControls.visible = true


func _on_pause_pressed() -> void:
	var buttons = [$CanvasLayer/GameControls/Code, $CanvasLayer/GameControls/Penality, $CanvasLayer/GameControls/Hint, $CanvasLayer/GameControls/View]
	if is_paused == false:
		is_paused = true
		$CanvasLayer/GameControls/PauseAnimation.play("pause")
		$CanvasLayer/Timer.paused = true

		# Disable buttons and apply grayscale
		for button in buttons:
			button.disabled = true
	else:
		is_paused = false
		
		for button in buttons:
			button.disabled = false
			
		$CanvasLayer/Timer.paused = false
		$CanvasLayer/GameControls/PauseAnimation.play("RESET")


func _removing_leaves() -> void:
	var max_time = time_limits[Global.current_chapter]
	if $CanvasLayer/Timer.time_left < (max_time * 0.8) && $CanvasLayer/BackgroundControl/LeafFiveControl/leaf5.visible:
		$CanvasLayer/BackgroundControl/LeafFiveControl/leaf5.visible = false
	if $CanvasLayer/Timer.time_left < (max_time * 0.6) && $CanvasLayer/BackgroundControl/LeafFourControl/leaf4.visible:
		$CanvasLayer/BackgroundControl/LeafFourControl/leaf4.visible = false
	if $CanvasLayer/Timer.time_left < (max_time * 0.4) && $CanvasLayer/BackgroundControl/LeafThreeControl/leaf3.visible:
		$CanvasLayer/BackgroundControl/LeafThreeControl/leaf3.visible = false
	if $CanvasLayer/Timer.time_left < (max_time * 0.2) && $CanvasLayer/BackgroundControl/LeafTwoControl/leaf2.visible:
		$CanvasLayer/BackgroundControl/LeafTwoControl/leaf2.visible = false
	if $CanvasLayer/Timer.time_left < (max_time * 0.1) && $CanvasLayer/BackgroundControl/LeafOneControl/leaf1.visible:
		$CanvasLayer/BackgroundControl/LeafOneControl/leaf1.visible = false


func time_low_warning() -> void:
	if $CanvasLayer/Timer.time_left <= 120:
		$CanvasLayer/TimerControl/TimerBg/TimerText.modulate = Color(1, 0, 0)  # Set text to red


func _on_code_pressed() -> void:
	var digicode= Global.digicode.instantiate()
	digicode.hints_or_puzzles= 1
	add_child(digicode)

func _on_setting_button_pressed() -> void:
	add_child(Global.settings.instantiate())


func _on_timer_timeout() -> void:
	$CanvasLayer/BackgroundControl/TextureRect.texture = load("res://resources/background/looseScreen2.png")


func _on_increment_timer_timeout() -> void:
	seconds += 1
	if seconds == 60:
		seconds = 0
		minutes += 1


func remove_time() -> void:
	var time_left = $CanvasLayer/Timer.time_left
	if time_left > 60:
		$CanvasLayer/Timer.start(time_left - 60)
	else:
		if($CanvasLayer/BackgroundControl/TextureRect.texture!=load("res://resources/background/looseScreen2.png")):
			$CanvasLayer/BackgroundControl/TextureRect.texture = load("res://resources/background/looseScreen2.png")
		if $CanvasLayer/Timer.time_left > 0:
			seconds = time_left
			$CanvasLayer/Timer.stop()
		else:
			minutes = minutes + 1


func _on_hint_pressed() -> void:
	var digicode= Global.digicode.instantiate()
	digicode.hints_or_puzzles= 0
	add_child(digicode)
