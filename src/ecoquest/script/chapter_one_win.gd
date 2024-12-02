extends Node2D



func _on_close_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/home_page.tscn")
