extends Node2D


func _on_close_button_pressed() -> void:
	queue_free()
	get_tree().change_scene_to_file("res://scene/chapters_selection.tscn")
