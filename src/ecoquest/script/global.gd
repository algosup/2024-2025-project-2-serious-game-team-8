extends Node2D

var screen_size: Vector2 = Vector2()  # Initialize screen_size as a Vector2

func _ready() -> void:
	screen_size = DisplayServer.window_get_size()  # Get the current screen size in pixels

func _process(delta: float) -> void:
	print(screen_size)  # Print the screen size each frame
