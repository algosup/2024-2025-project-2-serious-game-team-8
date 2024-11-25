extends Node2D



func _on_setting_button_pressed() -> void:
	add_child(Global.settings.instantiate())


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/game_page.tscn")
