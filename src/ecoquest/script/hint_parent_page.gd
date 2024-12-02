extends Node2D

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			queue_free()
