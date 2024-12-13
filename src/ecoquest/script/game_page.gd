extends Node2D

# Variable to track whether the game is paused or not
var is_paused: bool = false

# List of music tracks for each chapter
var music_list = [
	[
		"res://resources/musics/music/The Final Escape.mp3",
		"res://resources/musics/music/Climate Crisis in the Company.mp3",
		"res://resources/musics/music/The Final Flee.mp3"
	],
	[
		"res://resources/musics/music/Labyrinth of Shadows.mp3",
		"res://resources/musics/music/Labyrinth Escape.mp3",
		"res://resources/musics/music/In the Lab of Shadows.mp3"
	]
]

# Current index of the music being played
var current_music_index: int = 0
# Reference to the AudioStreamPlayer node
@onready var music_player: AudioStreamPlayer = $BackgroundMusic

# Timer variables for minutes and seconds
@export var minutes: int
@export var seconds: int

# Flag to track if the chapter is finished
@export var is_chapter_finished: bool = false

# Time limits for each chapter in seconds
var time_limits = [600, 1800, 1200]

func _ready() -> void:
	# Display a transition effect at the start
	$TransitionLayer.visible = true
	await $TransitionLayer._fade_in()
	$TransitionLayer.visible = false

	# Start playing the current track
	play_current_track()

	# Initialize timer values
	minutes = 0
	seconds = 0

	# Start the timer with the time limit for the current chapter
	$CanvasLayer/Timer.start(time_limits[Global.current_chapter])


func _process(_delta: float) -> void:
	# Check if the chapter is finished
	if is_chapter_finished:
		if $CanvasLayer/Timer.is_stopped() == false:
			# Stop the timer and update the time variables
			minutes = int($CanvasLayer/Timer.time_left / 60)
			seconds = int(fmod($CanvasLayer/Timer.time_left, 60))
			$CanvasLayer/Timer.stop()
		else:
			# Stop the increment timer if the chapter is finished
			$CanvasLayer/IncrementTimer.stop()
	# Update the timer display if it is still running
	elif $CanvasLayer/Timer.is_stopped() == false && $CanvasLayer/Timer.time_left >= 1:
		minutes = int($CanvasLayer/Timer.time_left / 60)
		seconds = int(fmod($CanvasLayer/Timer.time_left, 60))
		_removing_leaves()
		time_low_warning()
		# Update the timer text depending on the active node
		if has_node("CodePage"):
			$CodePage/CanvasLayer/TimerControl/TimerBg/TimerText.text = "%02d:%02d" % [minutes, seconds]
		elif has_node("SecondEnigma"):
			$SecondEnigma/CanvasLayer/TimerControl/TimerBg/TimerText.text = "%02d:%02d" % [minutes, seconds]
		elif has_node("ThirdEnigma"):
			$ThirdEnigma/CanvasLayer/TimerControl/TimerBg/TimerText.text = "%02d:%02d" % [minutes, seconds]
		else:
			$CanvasLayer/TimerControl/TimerBg/TimerText.text = "%02d:%02d" % [minutes, seconds]
	else:
		# Start the increment timer if the main timer is stopped
		if $CanvasLayer/IncrementTimer.is_stopped():
			$CanvasLayer/IncrementTimer.start()
		# Update the increment timer display depending on the active node
		if has_node("CodePage"):
			$CodePage/CanvasLayer/TimerControl/TimerBg/TimerText.text = "+%02d:%02d" % [minutes, seconds]
		elif has_node("SecondEnigma"):
			$SecondEnigma/CanvasLayer/TimerControl/TimerBg/TimerText.text = "+%02d:%02d" % [minutes, seconds]
		elif has_node("ThirdEnigma"):
			$ThirdEnigma/CanvasLayer/TimerControl/TimerBg/TimerText.text = "+%02d:%02d" % [minutes, seconds]
		else:
			$CanvasLayer/TimerControl/TimerBg/TimerText.text = "+%02d:%02d" % [minutes, seconds]


func play_current_track() -> void:
	# Load and play the audio stream for the current chapter and track
	var audio_stream: AudioStream = load(music_list[Global.current_chapter][current_music_index]) as AudioStream
	if audio_stream:
		music_player.stream = audio_stream
		music_player.play()
		# Connect the "finished" signal to handle when the track ends
		if not music_player.is_connected("finished", Callable(self, "_on_music_finished")):
			music_player.connect("finished", Callable(self, "_on_music_finished"))
	else:
		print("Error: Failed to load audio stream from path: ", music_list[current_music_index])


func _on_music_finished() -> void:
	# Move to the next track, looping back if at the end
	current_music_index = (current_music_index + 1) % music_list.size()
	play_current_track()


func _on_close_button_pressed() -> void:
	# Change the scene to the home page when the close button is pressed
	get_tree().change_scene_to_file("res://scene/home_page.tscn")


var visibilityOn = load("res://resources/svg/Icon/visibility.png")
var visibilityOff = load("res://resources/svg/Icon/no-visibility.png")


func _on_visibility_pressed() -> void:
	# Toggle the visibility of game controls and update the icon
	if $CanvasLayer/GameControls.visible:
		$CanvasLayer/VisibilityControl/Visibility.texture_normal = visibilityOff
		$CanvasLayer/GameControls.visible = false
	else:
		$CanvasLayer/VisibilityControl/Visibility.texture_normal = visibilityOn
		$CanvasLayer/GameControls.visible = true


func _on_pause_pressed() -> void:
	# Pause or resume the game and manage button states
	var buttons = [$CanvasLayer/GameControls/Code, $CanvasLayer/GameControls/Penality, $CanvasLayer/GameControls/Hint]
	if is_paused == false:
		is_paused = true
		$CanvasLayer/GameControls/PauseAnimation.play("pause")
		$CanvasLayer/Timer.paused = true
		for button in buttons:
			button.disabled = true
	else:
		is_paused = false
		for button in buttons:
			button.disabled = false
		$CanvasLayer/Timer.paused = false
		$CanvasLayer/GameControls/PauseAnimation.play("RESET")


func _removing_leaves() -> void:
	# Hide leaves as the timer decreases to certain thresholds
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
	# Change the timer text color to red when the time is low
	if $CanvasLayer/Timer.time_left <= 120:
		$CanvasLayer/TimerControl/TimerBg/TimerText.modulate = Color(1, 0, 0)


func _on_code_pressed() -> void:
	# Instantiate and add a code-related digicode scene
	var digicode = Global.digicode.instantiate()
	digicode.hints_or_puzzles = 1
	add_child(digicode)


func _on_setting_button_pressed() -> void:
	# Instantiate and add the settings page
	add_child(Global.settings.instantiate())


func _on_timer_timeout() -> void:
	# Display a "loss" screen when the timer runs out
	$CanvasLayer/BackgroundControl/TextureRect.texture = load("res://resources/background/looseScreen2.png")


func _on_increment_timer_timeout() -> void:
	# Increment the time variables when the increment timer times out
	seconds += 1
	if seconds == 60:
		seconds = 0
		minutes += 1


func remove_time() -> void:
	# Decrease the timer by 60 seconds or display a "loss" screen if time is insufficient
	var time_left = $CanvasLayer/Timer.time_left
	if time_left > 60:
		$CanvasLayer/Timer.start(time_left - 60)
	else:
		if ($CanvasLayer/BackgroundControl/TextureRect.texture != load("res://resources/background/looseScreen2.png")):
			$CanvasLayer/BackgroundControl/TextureRect.texture = load("res://resources/background/looseScreen2.png")
		if $CanvasLayer/Timer.time_left > 0:
			seconds = time_left
			$CanvasLayer/Timer.stop()
		else:
			minutes = minutes + 1


func _on_hint_pressed() -> void:
	# Instantiate and add a hint-related digicode scene
	var digicode = Global.digicode.instantiate()
	digicode.hints_or_puzzles = 0
	add_child(digicode)
