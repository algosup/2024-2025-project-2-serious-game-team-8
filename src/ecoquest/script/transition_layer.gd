extends CanvasLayer

signal transitioned

func _transition():
	$AnimationPlayer.play("fade_to_black")
	await $AnimationPlayer.animation_finished

func _fade_in():
	$AnimationPlayer.play("fade_to_normal")
	await $AnimationPlayer.animation_finished
	$".".visible=false

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_to_black":
		$AnimationPlayer.play("fade_to_normal")
		emit_signal("transitionned")
