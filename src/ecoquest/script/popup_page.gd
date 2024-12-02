extends Node2D

@export var text: String = ""

func _ready() -> void:
	$CanvasLayer/ColorRect/Label.text = text

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			queue_free()
