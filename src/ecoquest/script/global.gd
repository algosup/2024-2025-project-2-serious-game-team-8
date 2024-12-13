extends Node2D

var settings = preload("res://scene/settings_page.tscn")
var chapter_selection = preload("res://scene/chapters_selection.tscn")
var code_page = preload("res://scene/code_page.tscn")
var code_page_chapter_one = preload("res://scene/second_enigma.tscn")
var digicode_chapter_one = preload("res://scene/third_enigma.tscn")
var win_page = preload("res://scene/code_win_page.tscn")
var win_page_chapter_one = preload("res://scene/code_win_page_two.tscn")
var game_page = preload("res://scene/game_page.tscn")
var chapter_locked = preload("res://scene/locked_chapter.tscn")
var popup_page = preload("res://scene/popup_page.tscn")
var pop_up_enigma_two = preload("res://scene/pop_up_enigma_two.tscn")
var hint_page = preload("res://scene/hint_page.tscn")
var digicode = preload("res://scene/digicode.tscn")
var tutorial = preload("res://scene/game_page.tscn")
var confirmation_tutorial = preload("res://scene/confirmation_page.tscn")
var confirmation_chapter1 = preload("res://scene/confirmation_page_chapter_1.tscn")
var beat_chapter1: bool = false
var beat_chapter2: bool = false
var beat_chapter3: bool = false

var opened_hint_1_tutorial: bool = false
var opened_hint_2_tutorial: bool = false
var opened_hint_3_tutorial: bool = false
var opened_hint_4_tutorial: bool = false
var opened_hint_5_tutorial: bool = false

var initial_hint_button_color: Color = Color("363636")  # Dark gray
var final_hint_button_color: Color = Color("#ffffff")  # White

var screen_size: Vector2 = Vector2()  # Initialize screen_size as a Vector2
var music_slider_value: float = 1.0  # Default volume value
var sfx_slider_value: float = 1.0  # Default volume value

var current_chapter = 0

var is_enigma_two_card_one_visible: bool = false
var is_enigma_two_card_two_visible: bool = false
var is_enigma_two_card_three_visible: bool = false


func _ready() -> void:
	screen_size = DisplayServer.window_get_size()  # Get the current screen size in pixels
	load_game()


func load_game() -> void:
	if FileAccess.file_exists("user://EkoLock_save.json"):
		var f = FileAccess.open("user://EkoLock_save.json", FileAccess.READ)
		if f:
			# Read the entire file content as text
			var content = f.get_as_text()
			f.close()

			# Parse the JSON string into an array
			var result = JSON.parse_string(content)
			if result is Array:
				if result.size() >= 4:  # Ensure the array has at least 4 elements
					beat_chapter1 = result[0]
					beat_chapter2 = result[1]
					music_slider_value = result[2]
					sfx_slider_value = result[3]
				else:
					# Log a warning and use default values if array is incomplete
					print("Warning: Save file does not contain all required values. Using defaults.")
					reset_to_defaults()
			else:
				# Log a warning and use default values if parsing fails
				print("Warning: Save file is corrupted or not a valid JSON array. Using defaults.")
				reset_to_defaults()
	else:
		# Log info and use default values if the file does not exist
		print("No save file found. Using defaults.")
		reset_to_defaults()

func save_game() -> void:
	
	var save_values = [beat_chapter1, beat_chapter2, music_slider_value, sfx_slider_value]

	# Open the file in write mode
	var f = FileAccess.open("user://EkoLock_save.json", FileAccess.WRITE)

	# Convert the boolean array to a JSON string and store it
	f.store_string(JSON.stringify(save_values))

	# Close the file
	f.close()

func reset_to_defaults() -> void:
	beat_chapter1 = false
	beat_chapter2 = false
	music_slider_value = 1.0
	sfx_slider_value = 1.0
