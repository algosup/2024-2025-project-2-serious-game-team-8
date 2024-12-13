extends Node2D

## This page is the confirmation page for chapter 1, it guides the user on how to
## get started before chapter 1, ensuring the player is all set up

func _on_close_button_pressed() -> void:
	queue_free() # removes the pop-up


func _on_texture_button_pressed() -> void:
	# Play the transition, then make the tutorial page as the parent
	$TransitionLayer.visible = true
	await $TransitionLayer._transition()
	get_tree().change_scene_to_packed(Global.tutorial)
