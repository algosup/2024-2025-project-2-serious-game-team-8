extends Node2D



func _on_texture_button_pressed() -> void:
	pass

var settings = preload("res://settings_page.tscn")
func _on_setting_button_pressed() -> void:
	get_tree().current_scene.add_child(settings)
