extends Node2D

## This script is linked to the digicode page. It handles user input, stores codes,
## checks the input against stored codes, and redirects to corresponding pop-ups or scenes.

## An integer representing the type of digicode: 0 for hints and 1 for puzzles.
@export var hints_or_puzzles: int = 0

# Stores the hint codes for each chapter as a 2D array, reused across chapters.
var hint_codes = [[["0090", "0054", "0060"]], [["0059", "0031"], ["0039"], ["0047", "0045", "0048"], ["0033"], ["0062"], ["0001"], ["0023"]]]

# Stores the puzzle codes for each chapter. When the correct code is entered, it redirects to the desired page.
var puzzle_codes = [["0090"], ["0031", "0023"]]

# Initialize the stream player for sound effects.
var sfx_player: AudioStreamPlayer

func _ready() -> void:
	# Set up the sound effect player and load the default sound effect.
	sfx_player = $SFX
	sfx_player.stream = load("res://resources/musics/sound_effects/digicode.mp3")

# Function triggered whenever a button on the digicode is pressed.
func _on_digicode_press(buttonID: int):
	# Play the sound effect if the player is initialized.
	if sfx_player:
		sfx_player.play()

	# Get references to the label displaying the code and its default color.
	var label = $CanvasLayer/DisplayControl/Label
	var original_color = label.get_theme_color("font_color", "Label")
	var red = Color(1, 0, 0)  # Red color for invalid input feedback.

	# Ensure hints_or_puzzles has a valid value (0 or 1); default to 0 if invalid.
	if hints_or_puzzles != (1 | 0):
		hints_or_puzzles = 0

	# Append the pressed button's value to the label text if it has less than 4 characters.
	if str(label.text).length() < 4:
		match buttonID:
			0:
				label.text += "0"
			1:
				label.text += "1"
			2:
				label.text += "2"
			3:
				label.text += "3"
			4:
				label.text += "4"
			5:
				label.text += "5"
			6:
				label.text += "6"
			7:
				label.text += "7"
			8:
				label.text += "8"
			9:
				label.text += "9"

	# Handle validation and redirection for the "Enter" button (buttonID == 10).
	if buttonID == 10:
		if hints_or_puzzles == 0:  # Hints mode.
			for i in range(hint_codes[Global.current_chapter].size()):
				if hint_codes[Global.current_chapter][i].has(label.text):
					# Instantiate the hint page.
					var hint_page = Global.hint_page.instantiate()

					# Set the hint index based on the matched code's index.
					hint_page.hint_index = i
					add_child(hint_page)

					# Reset the label text after success.
					label.text = ""
					return

			# Flash the label red for invalid input.
			for i in range(2):
				label.add_theme_color_override("font_color", red)
				await get_tree().create_timer(0.3).timeout
				label.add_theme_color_override("font_color", original_color)
				await get_tree().create_timer(0.3).timeout

		elif puzzle_codes[Global.current_chapter].has(label.text):  # Puzzle mode.
			# Instantiate and add the correct page for the entered code.
			var code_page_tutorial = Global.code_page.instantiate()
			if Global.current_chapter == 0:
				get_parent().add_child(code_page_tutorial)
				queue_free()
			elif Global.current_chapter == 1:
				if label.text == "0031":
					get_parent().add_child(Global.code_page_chapter_one.instantiate())
					queue_free()
				elif label.text == "0023":
					get_parent().add_child(Global.digicode_chapter_one.instantiate())
					queue_free()

		else:
			# Flash the label red for invalid input.
			for i in range(2):
				label.add_theme_color_override("font_color", red)
				await get_tree().create_timer(0.3).timeout
				label.add_theme_color_override("font_color", original_color)
				await get_tree().create_timer(0.3).timeout

	# Handle the "Remove" button: remove the last character.
	if buttonID == 11:
		label.text = label.text.substr(0, label.text.length() - 1)

# Open the settings menu when the settings button is pressed.
func _on_setting_button_pressed() -> void:
	add_child(Global.settings.instantiate())

# Close the digicode UI when the close button is pressed.
func _on_close_button_pressed() -> void:
	queue_free()
