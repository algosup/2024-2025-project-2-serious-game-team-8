extends CanvasLayer

## This script manages the transition between the different scenes,
## the transition includes a fade out and a fade int animation.

# A signal to notify when the "_transition" function is finished
signal transitionned

# Call the animationPlayer to start the fade out animation.
func _transition():
	$AnimationPlayer.play("fade_to_black")
	await $AnimationPlayer.animation_finished
	
# Call the animationPlayer to start the fade in animation.
func _fade_in():
	$AnimationPlayer.play("fade_to_normal")
	await $AnimationPlayer.animation_finished
	$".".visible=false
	
# Once the fade out is finished, start the fade in animation and call the "transitionned" signal.
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_to_black":
		$AnimationPlayer.play("fade_to_normal")
		emit_signal("transitionned")
		
