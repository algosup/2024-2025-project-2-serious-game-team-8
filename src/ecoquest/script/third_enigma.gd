extends Node2D

## This script manages the different interactions of the third enigma, which is a digicode,
## The different features of the third enigma include:
## - 10 buttons to input a code of 4 digit,
## - visual and audio feedback.

# The variable holding the code inputed,
# the code is limited to 4 digits
var code = ""

# The variable allowing the changes of the different SFX
var sfx_player: AudioStreamPlayer

func _ready() -> void:
	$CanvasLayer/TimerControl/TimerBg/TimerText.modulate = get_parent().get_child(0).get_node("TimerControl").get_node("TimerBg").get_node("TimerText").modulate
	sfx_player = $SFX


# Function to play the digicode sound effect
func play_digicode_sfx() -> void:
	sfx_player.stream = load("res://resources/musics/sound_effects/digicode.mp3")
	sfx_player.play()


# Function to play the correct sound effect
func play_correct_sfx() -> void:
	sfx_player.stream = load("res://resources/musics/sound_effects/correct.mp3")
	sfx_player.play()


# Function to play the incorrect sound effect
func play_incorrect_sfx() -> void:
	sfx_player.stream = load("res://resources/musics/sound_effects/incorrect.mp3")
	sfx_player.play()

# Delete the scene and go back to the game page
func _on_return_button_pressed() -> void:
	queue_free()

# Manages the digicode's inputs
func _on_button_pressed(number: int) -> void:
	# Play the digicode sound effect
	play_digicode_sfx()
	
	# If the code has less than 4 digit, concatenate the new digit to the string 
	if code.length() < 4:
		code = code + str(number)
		
	# If the code has 4 digits 
	if code.length() == 4:
		# Check if the code is correct
		if code == "4132":
			# Stop the timer
			get_parent().is_chapter_finished = true
			# Play the "success" sound effect
			play_correct_sfx()
			
			# Start the "success" animation, making the outer ring flash in green 2 times. 
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(0, 0.988, 0)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(1, 1, 1)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(0, 0.988, 0)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(1, 1, 1)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			
			# Display the win page, set the chapter 1 as beaten and save the game
			add_child(Global.win_page_chapter_one.instantiate())
			Global.beat_chapter2 = true
			Global.save_game()

		else:
			# Play the "failure" sound effect
			play_incorrect_sfx()
			
			# Start the "failure" animation, making the outer ring flash in red 2 times. 
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(0.988, 0, 0)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(1, 1, 1)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(0.988, 0, 0)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(1, 1, 1)
			
			# Reset the code
			code = ""
