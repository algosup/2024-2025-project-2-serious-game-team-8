extends Node2D

## This page appears to ensure the user has have got all the necessary information
## before getting starting with the tutorial. This script only serve to clean the 
## pop-up, or redirect the player to the game page


func _on_close_button_pressed() -> void:
	# Remove the pop-up from the screen
	queue_free()

# This function is linked to the start button, it redirects the user to the game page
func _on_texture_button_pressed() -> void:
	# Play the transition, then make the tutorial page as the parent
	$TransitionLayer.visible = true
	await $TransitionLayer._transition()
	get_tree().change_scene_to_packed(Global.tutorial)
