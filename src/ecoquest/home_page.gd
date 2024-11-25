extends Node2D


func _on_texture_button_pressed() -> void:
	add_child(Global.chapter_selection.instantiate())
	


func _on_setting_button_pressed() -> void:
	add_child(Global.settings.instantiate())
