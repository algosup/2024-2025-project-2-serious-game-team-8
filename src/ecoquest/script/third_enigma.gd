extends Node2D

var code = ""

var sfx_player: AudioStreamPlayer


func _ready() -> void:
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


func _on_return_button_pressed() -> void:
	queue_free()


func _on_button_pressed(number: int) -> void:
	play_digicode_sfx()
	if code.length() < 4:
		code = code + str(number)
	if code.length() == 4:
		if code == "4132":
			get_parent().is_chapter_finished = true
			play_correct_sfx()
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(0, 0.988, 0)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(1, 1, 1)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(0, 0.988, 0)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(1, 1, 1)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			add_child(Global.win_page_chapter_one.instantiate())
			Global.beat_chapter2 = true
			Global.save_game()

		else:
			play_incorrect_sfx()
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(1, 0, 0)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(0.988, 1, 1)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(0.988, 0, 0)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(1, 1, 1)

			code = ""
