extends Node2D

var settings = preload("res://scene/settings_page.tscn")
var chapter_selection = preload("res://scene/chapters_selection.tscn")
var code_page = preload("res://scene/code_page.tscn")

var screen_size: Vector2 = Vector2()  # Initialize screen_size as a Vector2
var music_slider_value: float = 1.0  # Default volume value


func _ready() -> void:
	screen_size = DisplayServer.window_get_size()  # Get the current screen size in pixels

func _process(_delta: float) -> void:
	pass
