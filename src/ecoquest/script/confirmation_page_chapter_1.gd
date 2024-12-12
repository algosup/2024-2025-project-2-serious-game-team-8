extends Node2D


func _on_close_button_pressed() -> void:
	queue_free()


func _on_texture_button_pressed() -> void:
	$TransitionLayer.visible = true
	await $TransitionLayer._transition()
	get_tree().change_scene_to_packed(Global.tutorial)
