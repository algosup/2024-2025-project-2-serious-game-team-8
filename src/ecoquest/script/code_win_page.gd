extends Node2D


func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			queue_free()
			get_tree().change_scene_to_file("res://scene/chapters_selection.tscn")
