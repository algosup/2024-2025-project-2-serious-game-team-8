extends Node2D

## This script is linked to the code page (Tutorial's last enigma), this script does the checking for
## the enigma, initializes various codes, manage user input and plays SFX.

var sfx_player: AudioStreamPlayer # initializing the audio stream player of the page for easier  usage


func _ready() -> void:
	# The line below serves at retrieving the timer and its current time to initialize the time on a
	# child of the game page
	$CanvasLayer/TimerControl/TimerBg/TimerText.modulate = get_parent().get_child(0).get_node("TimerControl").get_node("TimerBg").get_node("TimerText").modulate
	
	# Giving the sfx player node
	sfx_player = $SFX

# Function that frees the screen back to the parent when pressed
func _on_return_button_pressed() -> void:
	queue_free()

# Variables for storing user inputs
var input1 = "CanvasLayer/CodeControl/Input1/Label"
var input2 = "CanvasLayer/CodeControl/Input2/Label"
var input3 = "CanvasLayer/CodeControl/Input3/Label"
var input4 = "CanvasLayer/CodeControl/Input4/Label"

# Storing the different codes, for respectively tutorial, chapter 1, chapter2
var codes=["3426","1443","1566"]

# Function to play the incorrect sound effect
func play_incorrect_sfx() -> void:
	sfx_player.stream = load("res://resources/musics/sound_effects/windowserror.mp3")
	sfx_player.play()

# Function to handle user input
func _on_input_pressed(buttonID: int) -> void:
	# match case to handle addition and substraction via buttons
	match buttonID:
		# First register
		1:  # If the button at the top has been pressed adds 1 to the register
			if int(get_node(input1).text) < 9:
				get_node(input1).text = str(int(get_node(input1).text) + 1)
			else:
				# if above 9, goes back to 0
				get_node(input1).text = "0"
		2:  # If the button at the bottom has been pressed substracts 1 to the register
			if int(get_node(input1).text) > 0:
				get_node(input1).text = str(int(get_node(input1).text) - 1)
			else:
				# if below 0, sets to 9
				get_node(input1).text = "9"
		# Second Register
		3:  # Same logic as the register above
			if int(get_node(input2).text) < 9:
				get_node(input2).text = str(int(get_node(input2).text) + 1)
			else:
				get_node(input2).text = "0"
		4:
			if int(get_node(input2).text) > 0:
				get_node(input2).text = str(int(get_node(input2).text) - 1)
			else:
				get_node(input2).text = "9"
		# Third Register
		5:
			if int(get_node(input3).text) < 9:
				get_node(input3).text = str(int(get_node(input3).text) + 1)
			else:
				get_node(input3).text = "0"
		6:
			if int(get_node(input3).text) > 0:
				get_node(input3).text = str(int(get_node(input3).text) - 1)
			else:
				get_node(input3).text = "9"
		# Fourth Register
		7:
			if int(get_node(input4).text) < 9:
				get_node(input4).text = str(int(get_node(input4).text) + 1)
			else:
				get_node(input4).text = "0"
		8:
			if int(get_node(input4).text) > 0:
				get_node(input4).text = str(int(get_node(input4).text) - 1)
			else:
				get_node(input4).text = "9"

# This function runs eveytime the enter button is pressed to check if the code
# entered is the right one. 
func _on_enter_button_pressed() -> void:
	# stores in the variable the text of each input
	var answer = get_node(input1).text + get_node(input2).text + get_node(input3).text + get_node(input4).text
	
	# checks if the answer is the correct one for the chapter selected
	if str(answer) == codes[Global.current_chapter]:
		add_child(Global.win_page.instantiate())
		# set the chapter finished boolean to true, this stops the timer
		get_parent().is_chapter_finished = true
		# sets the global variable to true, this changes the menu selection page
		# and unlock the chapter for the user
		Global.beat_chapter1 = true
		# Save the state of completion to not lose progress
		Global.save_game()
	else:
		play_incorrect_sfx()
		# instantiate the pop-up
		var popup = Global.popup_page.instantiate()
		# set the text of the pop-up dynamically
		popup.text= "There was an error. \nThis was the wrong password. \n-1 minute to the timer"
		popup.color= Color(1,0,0)
		add_child(popup)
		var time_left = get_parent().get_child(0).get_node("Timer").time_left
		get_parent().remove_time()
		# remove 60 seconds to the timer as the user has made an error
		if time_left <= 60:
			$CanvasLayer/TimerControl/TimerBg/TimerText.modulate =  Color(1, 0, 0)
		
