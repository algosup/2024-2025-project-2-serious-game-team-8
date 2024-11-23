extends Node2D



func _on_texture_button_pressed() -> void:
	pass

var settings = preload("res://scene/settings_page.tscn")
func _on_setting_button_pressed() -> void:
	add_child(settings.instantiate())
