extends Node2D

var settings = preload("res://scene/settings_page.tscn")
var chapter_selection = preload("res://scene/chapters_selection.tscn")
var code_page = preload("res://scene/code_page.tscn")
var code_page_chapter_one = preload("res://scene/second_enigma.tscn")
var win_page = preload("res://scene/code_win_page.tscn")
var game_page = preload("res://scene/game_page.tscn")
var chapter_one_completion_page = preload("res://scene/chapter_one_win.tscn")
var chapter_locked = preload("res://scene/locked_chapter.tscn")
var popup_page = preload("res://scene/popup_page.tscn")
var pop_up_enigma_two = preload("res://scene/pop_up_enigma_two.tscn")
var hint_page = preload("res://scene/hint_page.tscn")
var digicode = preload("res://scene/digicode.tscn")
var tutorial= preload("res://scene/game_page.tscn")
var confirmation_tutorial = preload("res://scene/confirmation_page.tscn")
var confirmation_chapter1 = preload("res://scene/confirmation_page_chapter_1.tscn")
var beat_chapter1: bool = true
var beat_chapter2: bool = false
var beat_chapter3: bool = false


var opened_hint_1_tutorial: bool = false
var opened_hint_2_tutorial: bool = false
var opened_hint_3_tutorial: bool = false

var initial_hint_button_color: Color = Color('363636')  # Dark gray
var final_hint_button_color: Color = Color('#ffffff')   # White

var screen_size: Vector2 = Vector2()  # Initialize screen_size as a Vector2
var music_slider_value: float = 1.0  # Default volume value

var current_chapter = 0

var is_enigma_two_card_one_visible: bool = false
var is_enigma_two_card_two_visible: bool = false
var is_enigma_two_card_three_visible: bool = false

func _ready() -> void:
	screen_size = DisplayServer.window_get_size()  # Get the current screen size in pixels
