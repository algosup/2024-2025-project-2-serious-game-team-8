extends Node2D

@export var text: String = ""
@export var color: Color = Color(1,1,1)

func _ready() -> void:
	$CanvasLayer/ColorRect/Label.text = text
	$CanvasLayer/ColorRect/Label.add_theme_color_override("font_color", color)
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			queue_free()
